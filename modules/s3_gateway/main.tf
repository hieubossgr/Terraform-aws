resource "aws_vpc_endpoint" "s3_gateway" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.${var.region}.s3"
  route_table_ids = var.route_table_ids

  tags = {
    Name = "S3 Gateway Endpoint"
  }
}