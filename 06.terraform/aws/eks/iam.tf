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

resource "aws_iam_role_policy" "eks-adot-policy" {
  name = "AWSDistroOpenTelemetryPolicy"
  policy = jsonencode(
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "logs:PutLogEvents",
                    "logs:CreateLogGroup",
                    "logs:CreateLogStream",
                    "logs:DescribeLogStreams",
                    "logs:DescribeLogGroups",
                    "xray:PutTraceSegments",
                    "xray:PutTelemetryRecords",
                    "xray:GetSamplingRules",
                    "xray:GetSamplingTargets",
                    "xray:GetSamplingStatisticSummaries",
                    "ssm:GetParameters"
                ],
                "Resource": "*"
            }
        ]
    }
  )
  role = aws_iam_role.eks-node.id
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