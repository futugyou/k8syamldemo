resource "aws_subnet" "cicd-subnet-private" {
  count = length(var.private-subnet)

  cidr_block           = element(concat(var.private-subnet, [""]), count.index)
  availability_zone    = length(regexall("^[a-z]{2}-", element(local.azs, count.index))) > 0 ? element(local.azs, count.index) : null
  availability_zone_id = length(regexall("^[a-z]{2}-", element(local.azs, count.index))) == 0 ? element(local.azs, count.index) : null

  assign_ipv6_address_on_creation = false
  map_public_ip_on_launch         = false
  tags = {
    "Name"     = format("cicd-private%s", count.index + 1)
    "workshop" = format("cicd-private%s", count.index + 1)
  }
  vpc_id = aws_vpc.vpc-cicd.id

  timeouts {}
}

resource "aws_subnet" "cicd-subnet-public" {
  count = length(var.public-subnet)

  cidr_block           = element(concat(var.public-subnet, [""]), count.index)
  availability_zone    = length(regexall("^[a-z]{2}-", element(local.azs, count.index))) > 0 ? element(local.azs, count.index) : null
  availability_zone_id = length(regexall("^[a-z]{2}-", element(local.azs, count.index))) == 0 ? element(local.azs, count.index) : null

  assign_ipv6_address_on_creation = false
  tags = {
    "Name"     = format("cicd-public%s", count.index + 1)
    "workshop" = format("cicd-public%s", count.index + 1)
  }
  vpc_id = aws_vpc.vpc-cicd.id

  timeouts {}
}
