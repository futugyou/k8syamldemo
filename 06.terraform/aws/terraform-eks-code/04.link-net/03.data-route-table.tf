data "aws_route_table" "cicd-rtb" {
  vpc_id = data.aws_vpc.vpc-cicd.id
  filter {
    name   = "tag:Name"
    values = ["cicd-private-route-table"]
  }
}

data "aws_route_table" "isolated" {
  vpc_id = data.aws_vpc.vpc-eks.id
  filter {
    name   = "tag:Name"
    values = [format("%s-cluster/IsolatedRouteTable", var.cluster-vpc-name)]
  }
}

data "aws_route_tables" "private-rts" {
  vpc_id = data.aws_vpc.vpc-eks.id

  filter {
    name   = "tag:Name"
    values = ["*-cluster/PrivateRouteTable*"]
  }
}