data "aws_vpc" "vpc-default" {
  default = true
}

data "aws_vpc" "vpc-cicd" {
  default = false
  filter {
    name   = "tag:workshop"
    values = [var.cicd-vpc-name]
  }
}

data "aws_vpc" "vpc-eks" {
  default = false
  filter {
    name   = "tag:name"
    values = [var.cluster-vpc-name]
  }
}
