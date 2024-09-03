output "ecs_cluster_name" {
  description = "Tên của ECS Cluster"
  value       = aws_ecs_cluster.cronjob_cluster.name
}

output "ecs_task_definition_arn" {
  description = "ARN của ECS Task Definition"
  value       = aws_ecs_task_definition.cronjob_task.arn
}

output "cloudwatch_event_rule_arn" {
  description = "ARN của CloudWatch Event Rule"
  value       = aws_cloudwatch_event_rule.cronjob_schedule.arn
}