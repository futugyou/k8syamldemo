// for pod network
resource "aws_subnet" "additional-subnet" {
  count                = length(var.additional-subnet)
  cidr_block           = element(concat(var.additional-subnet, [""]), count.index)
  availability_zone    = length(regexall("^[a-z]{2}-", element(local.azs, count.index))) > 0 ? element(local.azs, count.index) : null
  availability_zone_id = length(regexall("^[a-z]{2}-", element(local.azs, count.index))) == 0 ? element(local.azs, count.index) : null

  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false
  tags = {
    "Name"                                      = format("%s-pod-%s", var.cluster-name, count.index + 1)
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
    "workshop"                                  = format("subnet-pod-%s", count.index + 1)
  }
  vpc_id = aws_vpc.cluster.id

  depends_on = [aws_vpc_ipv4_cidr_block_association.vpc-cidr-assoc]
  timeouts {}
}

// for managed node? network
resource "aws_subnet" "cluster-subnet" {
  count                = length(var.cluster-subnet)
  cidr_block           = element(concat(var.cluster-subnet, [""]), count.index)
  availability_zone    = length(regexall("^[a-z]{2}-", element(local.azs, count.index))) > 0 ? element(local.azs, count.index) : null
  availability_zone_id = length(regexall("^[a-z]{2}-", element(local.azs, count.index))) == 0 ? element(local.azs, count.index) : null

  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false
  tags = {
    "Name"                                      = format("%s-private-%s", var.cluster-name, count.index + 1)
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
    "workshop"                                  = format("subnet-private-%s", count.index + 1)
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}
