variable "default_region" {
  description = "cluster region"
  type        = string
  default     = "ap-southeast-1"
}

variable "cluster_name" {
  description = "Name of Cluster"
  type        = string
  default     = "eks-osim-dev"
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

variable "jx_git_url" {
  description = "jx git url"
  type        = string
  default     = ""
}

variable "jx_bot_username" {
  description = "jx bot username"
  type        = string
  default     = ""
}

variable "jx_bot_token" {
  description = "jx bot token"
  type        = string
  default     = ""
}
