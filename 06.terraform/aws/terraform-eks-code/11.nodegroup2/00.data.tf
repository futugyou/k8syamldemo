data "aws_eks_cluster" "eks_cluster" {
  name = var.cluster-name
}

data "aws_ssm_parameter" "eks_ami" {
  name = format("/aws/service/eks/optimized-ami/%s/amazon-linux-2/recommended/image_id", data.aws_eks_cluster.eks_cluster.version)
}

data "aws_security_groups" "allnodes-sg" {
  tags = {
    "Name" = format("%s-cluster/ClusterSharedNodeSecurityGroup", var.cluster-name)
  }
}

data "aws_iam_role" "node-role" {
  name = "eks-cluster-node-role"
}

data "aws_subnets" "cluster-private" {
  filter {
    name   = "tag:Name"
    values = [format("%s-private-*", var.cluster-name)]
  }
}

data "aws_vpc" "vpc-eks" {
  default = false
  filter {
    name   = "tag:Name"
    values = [var.cluster-name]
  }
}

data "aws_subnet" "p1" {
  vpc_id = data.aws_vpc.vpc-eks.id
  filter {
    name   = "tag:workshop"
    values = ["subnet-private-1"]
  }
}

data "aws_subnet" "p2" {
  vpc_id = data.aws_vpc.vpc-eks.id
  filter {
    name   = "tag:workshop"
    values = ["subnet-private-2"]
  }
}


data "aws_subnet" "p3" {
  vpc_id = data.aws_vpc.vpc-eks.id
  filter {
    name   = "tag:workshop"
    values = ["subnet-private-3"]
  }
}

output "endpoint" {
  value = data.aws_eks_cluster.eks_cluster.endpoint
}

output "ca" {
  value = data.aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

# Only available on Kubernetes version 1.13 and 1.14 clusters created or upgraded on or after September 3, 2019.
output "identity-oidc-issuer" {
  value = data.aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "cluster-name" {
  value = data.aws_eks_cluster.eks_cluster.name
}
