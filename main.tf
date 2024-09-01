resource "aws_default_vpc" "default" {
}

module "vpc" {
  source = "./modules/networking/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr-1 = var.public_subnet_cidr-1
  public_subnet_cidr-2 = var.public_subnet_cidr-2
  private_ecs_subnet_cidr = var.private_ecs_subnet_cidr
  private_cronjob_subnet_cidr = var.private_cronjob_subnet_cidr
  private_rds_subnet_cidr = var.private_rds_subnet_cidr
  availability_zone_public-1a = var.availability_zone_public-1a
  availability_zone_public-1b = var.availability_zone_public-1b
  availability_zone_private = var.availability_zone_private
  public_cidr_block = var.public_cidr_block
}

module "security_group" {
  source = "./modules/networking/security_group"
  vpc_id = module.vpc.vpc_custom
}

module "alb" {
  source = "./modules/alb"
  vpc_id              = module.vpc.vpc_custom
  subnet_ids          = [module.vpc.public_subnet_1, module.vpc.public_subnet_2]  # List các subnet public từ module VPC
  security_group_id   = module.security_group.alb_sg_id  # Security group cho ALB
  alb_name            = var.alb_name
}

module "ecs" {
  source = "./modules/ecs"
  
  cluster_ecs_name   = var.cluster_ecs_name
  task_family        = var.task_family
  task_cpu           = var.task_cpu
  task_memory        = var.task_memory
  container_name     = var.container_name
  container_image    = var.container_image
  container_cpu      = var.container_cpu
  container_memory   = var.container_memory
  container_port     = var.container_port
  service_name       = var.service_name
  desired_count      = var.desired_count
  private_subnets    = [module.vpc.private_ecs_subnet_id]
  security_group_id  = module.security_group.ecs_sg_id
  target_group_arn   = module.alb.alb_arn
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
}
