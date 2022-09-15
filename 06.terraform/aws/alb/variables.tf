variable "default_region" {
  description = "cluster region"
  type        = string
  default     = "ap-southeast-1"
}

variable "aws_lb_name" {
  description = "aws lb name"
  type        = string
  default     = "identity-tf"
}

variable "vpc_tag" {
  description = "vpc tag"
  type        = string
  default     = "default"
}

variable "alb_security_group_name" {
  description = "security group name"
  type        = string
  default     = "onecloud-alb"
}

variable "alb_subnet_prefix" {
  description = "alb subnets prefix"
  type        = string
  default     = "public-1"
}
