// it will create default 'route table' and 'network ACL'
// for managed node? network
resource "aws_vpc" "cluster" {
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = var.cluster-vpc-cidr
  enable_classiclink               = false
  enable_classiclink_dns_support   = false
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"
  tags = {
    "Name" = var.cluster-name
  }
}

output "eks-vpc" {
  value = aws_vpc.cluster.id
}

output "eks-cidr" {
  value = aws_vpc.cluster.cidr_block
}
