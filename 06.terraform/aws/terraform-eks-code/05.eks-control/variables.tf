variable "default_region" {
  description = "cluster region"
  type        = string
  default     = "ap-southeast-1"
}

variable "cluster-name" {
  description = "cluster name"
  type        = string
  default     = "terraform-eks"
}

variable "cluster_version" {
  description = "Version of Cluster"
  type        = string
  default     = "1.23"
}