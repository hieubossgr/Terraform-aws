resource "aws_default_vpc" "default" {
}

module "vpc" {
  source = "./modules/networking/vpc"
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
  alb_name            = "my-alb"  # Tên ALB
}


