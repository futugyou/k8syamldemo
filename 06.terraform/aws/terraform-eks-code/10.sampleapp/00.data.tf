data "aws_eks_cluster" "eks_cluster" {
  name = var.cluster-name
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
