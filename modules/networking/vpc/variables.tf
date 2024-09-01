variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr-1" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.6.0/24"
}

variable "public_subnet_cidr-2" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.5.0/24"
}

variable "private_ecs_subnet_cidr" {
  description = "CIDR block for the ECS private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_cronjob_subnet_cidr" {
  description = "CIDR block for the Cronjob private subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_rds_subnet_cidr" {
  description = "CIDR block for the RDS private subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "availability_zone_public-1a" {
  description = "Availability zone for the public subnet"
  type        = string
  default     = "ap-southeast-1a"
}

variable "availability_zone_public-1b" {
  description = "Availability zone for the public subnet"
  type        = string
  default     = "ap-southeast-1b"
}

variable "availability_zone_private" {
  description = "Availability zone for the private subnet"
  type        = string
  default     = "ap-southeast-1a"
}
