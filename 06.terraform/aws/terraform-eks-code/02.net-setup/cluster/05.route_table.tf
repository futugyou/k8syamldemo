// for pod network
resource "aws_route_table" "isolated-rtb" {
  propagating_vgws = []
  route            = []
  tags = {
    "Name" = format("%s-cluster/IsolatedRouteTable", var.cluster-name)
  }
  vpc_id = aws_vpc.cluster.id
}

// for managed node? network
resource "aws_route_table" "private-rtb" {
  count            = length(local.azs)
  propagating_vgws = []
  route            = []
  tags = {
    "Name" = format("%s-cluster/PrivateRouteTable-%s", var.cluster-name, element(local.azs, count.index))

  }
  vpc_id = aws_vpc.cluster.id
}
