resource "aws_route_table" "cicd-public-rtb" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cicd-igw.id
  }

  tags = {
    "Name" = "cicd-public-route-table"
  }
  vpc_id = aws_vpc.vpc-cicd.id
}

resource "aws_route_table" "cicd-private-rtb" {
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-cicd.id
  }
  tags = {
    "Name" = "cicd-private-route-table"
  }
  vpc_id = aws_vpc.vpc-cicd.id
}
