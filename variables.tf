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
variable "private_rds_subnet_cidr" {}
variable "availability_zone_public-1a" {}
variable "availability_zone_public-1b" {}
variable "availability_zone_private" {}
variable "public_cidr_block" {}
## MODULE VPC

## MODULE ECS
variable "cluster_ecs_name" {}
variable "task_family" {}
variable "task_cpu" {}
variable "task_memory" {}
# variable "execution_role_arn" {}
# variable "task_role_arn" {}
variable "container_name" {}
variable "container_image" {}
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