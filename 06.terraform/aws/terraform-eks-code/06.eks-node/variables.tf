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


variable "node-group-name" {
  description = "node group name"
  type        = string
  default     = "node-one"
}


variable "cluster_version" {
  description = "Version of Cluster"
  type        = string
  default     = "1.23"
}

variable "ec2_instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t3a.medium"
}
