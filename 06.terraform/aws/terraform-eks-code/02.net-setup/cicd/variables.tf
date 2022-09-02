variable "cicd-vpc-name" {
  description = "cicd vpc name"
  type        = string
  default     = "terraform-cicd"
}

variable "cicd-vpc-cidr" {
  description = "CIDR block for cicd VPC"
  type        = string
  default     = "172.30.0.0/24"
}

variable "private-subnet" {
  description = "cicd private subnet"
  type        = list(string)
  default     = ["172.30.0.128/26"]
}

variable "public-subnet" {
  description = "cicd public subnet"
  type        = list(string)
  default     = ["172.30.0.0/26"]
}

data "aws_availability_zones" "available" {}
locals {
  azs = data.aws_availability_zones.available.names
}
