resource "aws_vpc" "vpc-terraform" {
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = var.vpc_cidr
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_eip" "eip-terraform" {
  public_ipv4_pool = "amazon"
  tags             = {}
  vpc              = true
  timeouts {}
}

resource "aws_subnet" "privsubnet" {
  assign_ipv6_address_on_creation = false
  availability_zone               = "ap-southeast-1a"
  cidr_block                      = "10.1.4.0/24"
  map_public_ip_on_launch         = false
  tags = {
    "Name" = "Private subnet 10.1"
  }
  vpc_id = aws_vpc.vpc-terraform.id

  timeouts {}
}

resource "aws_subnet" "pubsubnet" {
  assign_ipv6_address_on_creation = false
  availability_zone               = "ap-southeast-1a"
  cidr_block                      = "10.1.1.0/24"
  map_public_ip_on_launch         = false
  tags = {
    "Name" = "Public subnet 10.1"
  }
  vpc_id = aws_vpc.vpc-terraform.id

  timeouts {}
}
