output "aws_instance_public_dns" {
  value = aws_instance.web.public_dns
  description = "Public DNS of instance"
}