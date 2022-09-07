resource "aws_vpc" "vpc-cicd" {
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = var.cicd-vpc-cidr
  enable_dns_hostnames             = false
  enable_dns_support               = true
  instance_tenancy                 = "default"
  tags = {
    "Name"     = var.cicd-vpc-name
    "workshop" = var.cicd-vpc-name
  }
}
