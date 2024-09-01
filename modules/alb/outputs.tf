output "alb_arn" {
  value = aws_lb.custom_alb.arn
}

output "alb_dns_name" {
  value = aws_lb.custom_alb.dns_name
}