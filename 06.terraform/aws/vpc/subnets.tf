data "aws_availability_zones" "available" {}

locals {
  azs = data.aws_availability_zones.available.names
}

resource "aws_subnet" "privsubnet" {
  count                = length(var.private_subnets)
  cidr_block           = element(concat(var.private_subnets, [""]), count.index)
  availability_zone    = length(regexall("^[a-z]{2}-", element(local.azs, count.index))) > 0 ? element(local.azs, count.index) : null
  availability_zone_id = length(regexall("^[a-z]{2}-", element(local.azs, count.index))) == 0 ? element(local.azs, count.index) : null

  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false
  tags = {
    "Name" = format("${var.vpc_name}-private-%s", element(local.azs, count.index))
  }
  vpc_id = aws_vpc.vpc-terraform.id

  timeouts {}
}

resource "aws_subnet" "pubsubnet" {
  count                = length(var.public_subnets)
  cidr_block           = element(concat(var.public_subnets, [""]), count.index)
  availability_zone    = length(regexall("^[a-z]{2}-", element(local.azs, count.index))) > 0 ? element(local.azs, count.index) : null
  availability_zone_id = length(regexall("^[a-z]{2}-", element(local.azs, count.index))) == 0 ? element(local.azs, count.index) : null

  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false
  tags = {
    "Name" = format("${var.vpc_name}-public-%s", element(local.azs, count.index))
  }
  vpc_id = aws_vpc.vpc-terraform.id

  timeouts {}
}
