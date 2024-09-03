## AWS PROVIDER
variable "region" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}
## AWS PROVIDER

# variable "vpc_cidr" {}

## EC2
variable "key_name" {}
variable "private_key_path" {}
## EC2

## MODULE ALB
variable "alb_name" {}
## MODULE ALB

## MODULE VPC
variable "vpc_cidr_block" {}
variable "public_subnet_cidr-1" {}
variable "public_subnet_cidr-2" {}
variable "private_ecs_subnet_cidr" {}
variable "private_cronjob_subnet_cidr" {}
variable "private_rds_subnet_cidr_1" {}
variable "private_rds_subnet_cidr_2" {}
variable "availability_zone_1a" {}
variable "availability_zone_1b" {}
variable "public_cidr_block" {}
## MODULE VPC

## MODULE ECS
variable "cluster_ecs_name" {}
variable "task_family" {}
variable "task_cpu" {}
variable "task_memory" {}
variable "container_name" {}
variable "ecs_container_image" {}
variable "container_cpu" {}
variable "container_memory" {}
variable "container_port" {}
variable "service_name" {}
variable "desired_count" {}
variable "private_subnets" {}
variable "security_group_id" {}
variable "target_group_arn" {}
variable "max_capacity" {}
variable "min_capacity" {}
## MODULE ECS

## MODULE RDS AURORA
variable "cluster_rds" {}
variable "availability_zone" {}
variable "engine_aurora" {}
variable "engine_version" {}
variable "database_name" {}
variable "master_username" {}
variable "master_password" {}
variable "rds_write_number" {}
variable "rds_read_number" {}
variable "rds_instance_class" {}
variable "reader_max_capacity" {}
variable "reader_min_capacity" {}
## MODULE RDS AURORA

## MODULE CRONJOB
variable "cronjob_name" {}
variable "cronjob_container_image" {}
variable "cronjob_command" {}
variable "schedule_expression" {}
variable "cronjob_cpu" {}
variable "cronjob_memory" {}
## MODULE CRONJOB

## MODULE S3
variable "bucket_name" {}
## MODULE S3