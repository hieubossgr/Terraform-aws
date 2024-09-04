## AWS REGION
region = "ap-southeast-1"
aws_access_key = ""
aws_secret_key = ""
## AWS REGION

## EC2
private_key_path = ""
key_name = "ec2-persional"
## EC2

# vpc_cidr = "10.0.0.0/16"

## MODULE ALB
alb_name = "my-alb"
## MODULE ALB

## MODULE VPC
vpc_cidr_block = "10.0.0.0/16"
public_subnet_cidr-1 = "10.0.6.0/24"
public_subnet_cidr-2 = "10.0.5.0/24"
private_ecs_subnet_cidr = "10.0.2.0/24"
private_cronjob_subnet_cidr = "10.0.3.0/24"
private_rds_subnet_cidr_1 = "10.0.4.0/24"
private_rds_subnet_cidr_2 = "10.0.7.0/24"
availability_zone_1a = "ap-southeast-1a"
availability_zone_1b = "ap-southeast-1b"
public_cidr_block = "0.0.0.0/0"
## MODULE VPC

## MODULE ECS
cluster_ecs_name = "my-cluster"
task_family = "my-task-family"
task_cpu = "1024"
task_memory = "2048"
container_name = "amzn-sample-container"
ecs_container_image = "public.ecr.aws/ecs-sample-image/amazon-ecs-sample:latest"
container_cpu = "256"
container_memory = "512"
container_port = 80
service_name = "ecs-sample"
desired_count = 2
private_subnets = []
security_group_id = ""
target_group_arn = ""
max_capacity = 3
min_capacity = 1
## MODULE ECS

## MODULE RDS AURORA
cluster_rds = "aurora-cluster"
availability_zone = ["ap-southeast-1a", "ap-southeast-1b"]
engine_aurora = "aurora-mysql"
engine_version = "5.7.mysql_aurora.2.11.2"
database_name = "hblabs"
master_username = "admin"
master_password = "admin123312"
rds_write_number = 1
rds_read_number = 2
rds_instance_class = "db.r5.large"
reader_max_capacity = 4
reader_min_capacity = 2
## MODULE RDS AURORA

## MODULE CRONJOB
cronjob_name = "cronjob-for-ecs"
cronjob_container_image = "ubuntu:latest"
cronjob_command = ["sh", "-c", "echo Hello World"]
schedule_expression = "cron(0 12 * * ? *)"
cronjob_cpu = "256"
cronjob_memory = "512"
## MODULE CRONJOB

## MODULE S3
bucket_name = "s3-bucket-example-aa"
## MODULE S3

## MODULE IAM
role_name   = "gitlab-runner-rule"
policy_name = "gitlab-runner-policy"
## MODULE IAM

## MODULE ECR
repository_name = "ecr-example"
## MODULE ECR

## MODULE ROUTE53
route53_name = "terraform.hblabs.com"
## MODULE ROUTE53

## MODULE CODEDEPLOY
application_name = "aws_codedeploy"
deployment_group_name = "codedeploy_group"
## MODULE CODEDEPLOY