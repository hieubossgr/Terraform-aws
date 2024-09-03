variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "route_table_ids" {
  description = "List of route table IDs to associate with the VPC endpoint"
  type        = list(string)
}