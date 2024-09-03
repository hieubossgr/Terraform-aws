# Tạo ECS Cluster cho CronJob
resource "aws_ecs_cluster" "cronjob_cluster" {
  name = "${var.name}-cluster"
}

# Tạo IAM Role cho ECS Task
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.name}-ecs-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

# ECS Task Execution Policy
resource "aws_iam_policy" "ecs_task_execution_policy" {
  name        = "${var.name}-ecs-task-execution-policy"
  description = "ECS Task execution policy for CronJob"
  policy      = data.aws_iam_policy_document.ecs_task_execution_policy.json
}

data "aws_iam_policy_document" "ecs_task_execution_policy" {
  statement {
    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:GetAuthorizationToken",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = aws_iam_policy.ecs_task_execution_policy.arn
}

# Create ECS Task Definition for CronJob
resource "aws_ecs_task_definition" "cronjob_task" {
  family                   = "${var.name}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "${var.name}-container"
      image     = var.container_image
      essential = true
      command   = var.command
    }
  ])
}

# Create CloudWatch Event Rule for CronJob Schedule
resource "aws_cloudwatch_event_rule" "cronjob_schedule" {
  name                = "${var.name}-cronjob-schedule"
  description         = "CloudWatch Event Rule to schedule CronJob Task"
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "ecs_task" {
  rule      = aws_cloudwatch_event_rule.cronjob_schedule.name
  target_id = "${var.name}-ecs-task"
  arn       = aws_ecs_cluster.cronjob_cluster.arn
  role_arn  = aws_iam_role.ecs_task_execution_role.arn

  ecs_target {
    task_definition_arn = aws_ecs_task_definition.cronjob_task.arn
    launch_type         = "FARGATE"
    network_configuration {
      subnets         = var.subnet_ids
      security_groups = [var.security_group_id]
      assign_public_ip = false
    }
  }
}

# Allow ECS Task via IAM Role
resource "aws_iam_role_policy" "allow_ecs_run_task" {
  name = "${var.name}-allow-ecs-run-task"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ecs:RunTask"],
        Resource = ["*"]
      }
    ]
  })

  role = aws_iam_role.ecs_task_execution_role.name
}