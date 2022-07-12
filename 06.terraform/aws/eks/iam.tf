data "aws_iam_policy" "AmazonEKSClusterPolicy" {
  name = "AmazonEKSClusterPolicy"
}

data "aws_iam_policy" "AmazonEKSWorkerNodePolicy" {
  name = "AmazonEKSWorkerNodePolicy"
}

data "aws_iam_policy" "AmazonEC2ContainerRegistryReadOnly" {
  name = "AmazonEC2ContainerRegistryReadOnly"
}

data "aws_iam_policy" "AmazonEKS_CNI_Policy" {
  name = "AmazonEKS_CNI_Policy"
}

data "aws_iam_policy_document" "ec2-instance" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "eks-instance" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "eks-cluster" {
  name = var.cluster_role_name
  assume_role_policy = data.aws_iam_policy_document.eks-instance.json
  managed_policy_arns = [data.aws_iam_policy.AmazonEKSClusterPolicy.arn]
}

resource "aws_iam_role" "eks-node" {
  name = var.node_role_name
  assume_role_policy = data.aws_iam_policy_document.ec2-instance.json
  managed_policy_arns = [data.aws_iam_policy.AmazonEC2ContainerRegistryReadOnly.arn, data.aws_iam_policy.AmazonEKS_CNI_Policy.arn, data.aws_iam_policy.AmazonEKSWorkerNodePolicy.arn]
}