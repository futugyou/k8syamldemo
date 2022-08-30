variable "default_region" {
  description = "default region"
  type        = string
  default     = "ap-southeast-1"
}

variable "cloud9_role_name" {
  type    = string
  default = "eksworkshop-admin"
}

variable "xray_policy_name" {
  type    = string
  default = "xraysidecar"
}
