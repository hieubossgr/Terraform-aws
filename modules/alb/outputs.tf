output "alb_arn" {
  value = aws_lb.custom_alb.arn
}

output "alb_dns_name" {
  value = aws_lb.custom_alb.dns_name
}

output "alb_zone_id" {
  value = aws_lb.custom_alb.zone_id
}

output "http_listener_arn" {
  value = aws_lb_listener.http.arn
  description = "The ARN of the HTTP listener for the ALB."
}

output "ecs_target_group_arn" {
  value = aws_lb_target_group.ecs_target_group.arn
  description = "The ARN of the ECS target group"
}

output "ecs_target_group_arn_2" {
  value = aws_lb_target_group.ecs_target_group_2.arn
  description = "The ARN of the ECS target group"
}