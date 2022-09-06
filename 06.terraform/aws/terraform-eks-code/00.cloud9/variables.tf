variable "default_region" {
  description = "cluster region"
  type        = string
  default     = "ap-southeast-1"
}

variable "cloud9_name" {
  description = "cloud9 name"
  type        = string
  default     = "terraform-eks"
}

variable "cloud9_role_name" {
  type    = string
  default = "eksworkshop-admin"
}
