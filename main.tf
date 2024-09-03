resource "aws_default_vpc" "default" {
}

module "vpc" {
  source = "./modules/networking/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr-1 = var.public_subnet_cidr-1
  public_subnet_cidr-2 = var.public_subnet_cidr-2
  private_ecs_subnet_cidr = var.private_ecs_subnet_cidr
  private_cronjob_subnet_cidr = var.private_cronjob_subnet_cidr
  private_rds_subnet_cidr_1 = var.private_rds_subnet_cidr_1
  private_rds_subnet_cidr_2 = var.private_rds_subnet_cidr_2
  availability_zone_1a = var.availability_zone_1a
  availability_zone_1b = var.availability_zone_1b
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
  container_image    = var.ecs_container_image
  container_cpu      = var.container_cpu
  container_memory   = var.container_memory
  container_port     = var.container_port
  service_name       = var.service_name
  desired_count      = var.desired_count
  private_subnets    = [module.vpc.private_ecs_subnet_id]
  security_group_id  = module.security_group.ecs_sg_id
  target_group_arn   = module.alb.ecs_target_group_arn
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
}

module "rds-aurora" {
  source             = "./modules/rds-aurora"
  cluster_identifier = var.cluster_rds
  availability_zone = var.availability_zone
  engine_aurora = var.engine_aurora
  engine_version = var.engine_version
  database_name = var.database_name
  master_username = var.master_username
  master_password = var.master_password
  security_group_id = module.security_group.rds_sg_id
  subnet_ids = [module.vpc.private_rds_subnet_id_1, module.vpc.private_rds_subnet_id_2]
  rds_write_number = var.rds_write_number
  rds_read_number = var.rds_read_number
  instance_class = var.rds_instance_class
  reader_max_capacity = var.reader_max_capacity
  reader_min_capacity = var.reader_min_capacity
}

module "cronjob" {
  source = "./modules/cronjob"

  name                  = var.cronjob_name
  subnet_ids            = [module.vpc.private_cronjob_subnet_id]
  security_group_id     = module.security_group.cronjob_sg_id
  container_image       = var.cronjob_container_image
  command               = var.cronjob_command
  schedule_expression   = var.schedule_expression
  cpu                   = var.container_cpu
  memory                = var.container_memory

}

module "s3-bucket" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
}

module "iam" {
  source = "./modules/iam"

  role_name = var.role_name
  policy_name = var.policy_name
  s3_bucket_name = module.s3-bucket.bucket_name
}
