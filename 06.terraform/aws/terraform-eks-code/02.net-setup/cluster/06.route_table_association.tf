// for pod network
resource "aws_route_table_association" "isolated-rtbassoc" {
  count = length(var.additional-subnet)

  subnet_id      = element(aws_subnet.additional-subnet[*].id, count.index)
  route_table_id = aws_route_table.isolated-rtb.id
}

// for managed node? network
resource "aws_route_table_association" "private-rtbassoc" {
  count = length(var.cluster-subnet)

  subnet_id      = element(aws_subnet.cluster-subnet[*].id, count.index)
  route_table_id = element(aws_route_table.private-rtb[*].id, count.index)
}
