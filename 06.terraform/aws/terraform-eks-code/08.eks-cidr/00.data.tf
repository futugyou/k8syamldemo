data "aws_eks_cluster" "eks_cluster" {
  name = var.cluster-name
}

data "aws_vpc" "vpc-eks" {
  default = false
  filter {
    name   = "tag:Name"
    values = [var.cluster-name]
  }
}

data "aws_subnet" "i1" {
  vpc_id = data.aws_vpc.vpc-eks.id
  filter {
    name   = "tag:workshop"
    values = ["subnet-pod-1"]
  }
}

data "aws_subnet" "i2" {
  vpc_id = data.aws_vpc.vpc-eks.id
  filter {
    name   = "tag:workshop"
    values = ["subnet-pod-2"]
  }
}


data "aws_subnet" "i3" {
  vpc_id = data.aws_vpc.vpc-eks.id
  filter {
    name   = "tag:workshop"
    values = ["subnet-pod-3"]
  }
}
