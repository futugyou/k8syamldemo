variable "cluster-name" {
  description = "cluster name"
  type        = string
  default     = "terraform-eks"
}

variable "cluster-vpc-cidr" {
  description = "CIDR block for cluster VPC"
  type        = string
  default     = "10.0.0.0/22"
}

variable "cluster-subnet" {
  description = "cluster subnet"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "additional-cidr" {
  description = "additional IPv4 CIDR blocks to cluster"
  type        = string
  default     = "100.64.0.0/16"
}

variable "additional-subnet" {
  description = "additional subnet"
  type        = list(string)
  default     = ["100.64.0.0/18", "100.64.64.0/18", "100.64.128.0/18"]
}

data "aws_availability_zones" "available" {}
locals {
  azs = data.aws_availability_zones.available.names
}

data "aws_region" "current" {}


variable "endpoint-list" {
  description = "endpoint list"
  type        = list(string)
  default     = ["autoscaling", "ec2", "ec2messages", "ecr.api", "ecr.dkr", "elasticloadbalancing", "logs", "ssm", "ssmmessages", "sts"]
}
