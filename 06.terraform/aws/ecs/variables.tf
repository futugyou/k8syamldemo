variable "default_region" {
  description = "cluster region"
  type        = string
  default     = "ap-southeast-1"
}

variable "ecs_name" {
  description = "ecs name"
  type        = string
  default     = "terraform-ecs"
}

variable "ecs_providers" {
  description = "ecs capacity providers"
  type        = list(string)
  default     = ["FARGATE", "FARGATE_SPOT"]
}
