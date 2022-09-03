resource "aws_iam_role" "eks-cluster-node-role" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "ec2.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "eks-cluster-node-role"
  path                  = "/"
  tags = {
    "Name" = "eks-cluster-nodegroup/NodeRole"
  }
} 
