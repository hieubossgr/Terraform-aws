variable "name" {
  description = "Name CronJob"
  type        = string
}

variable "subnet_ids" {
  description = "List subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "ID of Security Group for CronJob"
  type        = string
}

variable "container_image" {
  description = "Docker image for CronJob"
  type        = string
}

variable "command" {
  description = "Command execute CronJob container"
  type        = list(string)
}

variable "schedule_expression" {
  description = "Schedule"
  type        = string
}

variable "cpu" {
  description = "CPU of ECS Task"
  type        = string
}

variable "memory" {
  description = "Memory of ECS Task"
  type        = string
}