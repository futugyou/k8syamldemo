variable "default_region" {
  description = "cluster region"
  type        = string
  default     = "ap-southeast-1"
}

variable "mq_name" {
  description = "mq name"
  type        = string
  default     = "active_demo"
}

variable "mq_version" {
  description = "mq version"
  type        = string
  default     = "5.15.0"
}
