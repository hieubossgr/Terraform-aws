output "alb_arn" {
  value = aws_lb.custom_alb.id
}

output "alb_dns_name" {
  value = aws_lb.custom_alb.dns_name
}