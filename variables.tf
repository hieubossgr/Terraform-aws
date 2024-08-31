variable "region" {
  default = "ap-southeast-1"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default = "10.0.0.0/16"
}

variable "key_name" {
  default = "ec2-persional"
}
variable "private_key_path" {}