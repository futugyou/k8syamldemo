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

variable "cicd-vpc-name" {
  description = "cicd vpc name"
  type        = string
  default     = "terraform-cicd"
}

variable "cicd-subnet-tag" {
  description = "cicd subnet tag"
  type        = string
  default     = "cicd-private1"
}

variable "karpenter_version" {
  description = "Karpenter Version"
  default     = "0.6.5"
  type        = string
}
