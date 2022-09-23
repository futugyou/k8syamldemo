variable "default_region" {
  description = "cluster region"
  type        = string
  default     = "ap-southeast-1"
}

variable "cluster_version" {
  description = "cluster version"
  type        = string
  default     = "1.23"
}

variable "nginx_version" {
  description = "nginx chart version"
  type        = string
  default     = "3.12.0"
}
