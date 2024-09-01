variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr-1" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "public_subnet_cidr-2" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_ecs_subnet_cidr" {
  description = "CIDR block for the ECS private subnet"
  type        = string
}

variable "private_cronjob_subnet_cidr" {
  description = "CIDR block for the Cronjob private subnet"
  type        = string
}

variable "private_rds_subnet_cidr" {
  description = "CIDR block for the RDS private subnet"
  type        = string
}

variable "availability_zone_public-1a" {
  description = "Availability zone for the public subnet"
  type        = string
}

variable "availability_zone_public-1b" {
  description = "Availability zone for the public subnet"
  type        = string
}

variable "availability_zone_private" {
  description = "Availability zone for the private subnet"
  type        = string
}

variable "public_cidr_block" {
  description = "CIDR block for public route table"
  type        = string
}
