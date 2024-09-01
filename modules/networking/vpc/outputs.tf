output "public_subnet_1" {
  value = aws_subnet.public-1.id
}

output "public_subnet_2" {
  value = aws_subnet.public-2.id
}

output "private_ecs_subnet_id" {
  value = aws_subnet.private_ecs.id
}

output "private_cronjob_subnet_id" {
  value = aws_subnet.private_cronjob.id
}

output "private_rds_subnet_id" {
  value = aws_subnet.private_rds.id
}

output "vpc_custom" {
  value = aws_vpc.custom_vpc.id
}
