variable "default_region" {
  description = "default region"
  type        = string
  default     = "ap-southeast-1"
}

variable "s3_bucket_name" {
  description = "terraform_state s3_bucket_name"
  type        = string
  default     = "terraform-state-s3-storage"
}

variable "stages" {
  type    = list(string)
  default = ["net", "iam", "c9net", "cicd", "cluster", "nodeg", "eks-cidr"]
}
