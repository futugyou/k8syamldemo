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

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.1.0.0/16"
}
 
variable "ec2_instance_types" {
  description = "ec2 instance types"
  type        = list(string)
  default     = ["t3a.medium", "t3.medium"]
}
