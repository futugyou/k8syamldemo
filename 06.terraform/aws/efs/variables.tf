variable "default_region" {
  description = "cluster region"
  type        = string
  default     = "ap-southeast-1"
}

variable "efs_name" {
  description = "efs name"
  type        = string
  default     = "terraform-efs"
}
