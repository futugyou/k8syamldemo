variable "default_region" {
  description = "default region"
  type        = string
  default     = "ap-southeast-1"
}

variable "vpc_name" {
  description = "name of VPC"
  type        = string
  default     = "vpc-terraform"
}

variable "eip_name" {
  description = "name of eip"
  type        = string
  default     = "eip-terraform"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "public_subnets" {
  description = "public subnets"
  type        = list(string)
  default     = ["10.1.1.0/24"]
}

variable "private_subnets" {
  description = "private subnets"
  type        = list(string)
  default     = ["10.1.4.0/24"]
}