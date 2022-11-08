variable "default_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "ecr_repository_name" {
  description = "ecr repository name"
  type        = string
  default     = "aws-otel-collector-back"
}