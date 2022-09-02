resource "aws_route_table_association" "cicd-public-rtbassoc" {
  route_table_id = aws_route_table.cicd-public-rtb.id
  subnet_id      = aws_subnet.cicd-subnet-public[0].id
}

resource "aws_route_table_association" "cicd-private-rtbassoc" {
  route_table_id = aws_route_table.cicd-private-rtb.id
  subnet_id      = aws_subnet.cicd-subnet-private[0].id
}
