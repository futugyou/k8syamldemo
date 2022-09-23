variable "default_region" {
  description = "default region"
  type        = string
  default     = "ap-southeast-1"
}

variable "environment" {
  description = "Environment of Cluster"
  type        = string
  default     = "dev"
}

variable "cluster_name" {
  description = "Name of Cluster"
  type        = string
  default     = "eks-osim-dev"
}

variable "cluster_version" {
  description = "Version of Cluster"
  type        = string
  default     = "1.23"
}

variable "cluster_role_name" {
  description = "cluster role name"
  type        = string
  default     = "eks-osim-dev-cluster-role"
}

variable "node_role_name" {
  description = "node role name"
  type        = string
  default     = "eks-osim-dev-node-role"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

data "aws_availability_zones" "available" {}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "ingress_security_group_rule" {
  description = "ingress security group rule"
  type        = list(string)
  default     = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}

variable "ec2_instance_types" {
  description = "ec2 instance types"
  type        = list(string)
  default     = ["t3a.medium", "t3.medium"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}