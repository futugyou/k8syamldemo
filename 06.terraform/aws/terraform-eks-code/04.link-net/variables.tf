variable "cicd-vpc-name" {
  description = "cicd vpc name"
  type        = string
  default     = "terraform-cicd"
}

variable "cluster-vpc-name" {
  description = "cluster vpc name"
  type        = string
  default     = "terraform-eks"
}

variable "cloud9-label" {
  description = "Cloud9 IDE Name Label"
  type        = string
  default     = "eks-terraform"
}
