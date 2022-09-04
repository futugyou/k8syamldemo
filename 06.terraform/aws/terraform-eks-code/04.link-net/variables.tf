variable "cicd-vpc-name" {
  description = "cicd vpc name"
  type        = string
  default     = "terraform-cicd"
}

variable "cloud9-label" {
  description = "Cloud9 IDE Name Label"
  type        = string
  default     = "eks-terraform"
}
