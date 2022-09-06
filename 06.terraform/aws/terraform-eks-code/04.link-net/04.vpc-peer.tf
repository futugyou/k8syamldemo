resource "aws_vpc_peering_connection" "cicd-peer" {
  peer_vpc_id = data.aws_vpc.vpc-eks.id
  vpc_id      = data.aws_vpc.vpc-cicd.id
  auto_accept = true
  tags = {
    Name = "eks-peer-cicd"
  }
}

resource "aws_vpc_peering_connection" "def-peer" {
  peer_vpc_id = data.aws_vpc.vpc-eks.id
  vpc_id      = data.aws_vpc.vpc-default.id
  auto_accept = true
  tags = {
    Name = "eks-peer-default"
  }
}
