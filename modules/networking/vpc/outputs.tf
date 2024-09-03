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

output "private_rds_subnet_id_1" {
  value = aws_subnet.private_rds_1.id
}

output "private_rds_subnet_id_2" {
  value = aws_subnet.private_rds_2.id
}

output "vpc_custom" {
  value = aws_vpc.custom_vpc.id
}

output "route_table_ecs" {
  value = aws_route_table.private_route_table.id
}
