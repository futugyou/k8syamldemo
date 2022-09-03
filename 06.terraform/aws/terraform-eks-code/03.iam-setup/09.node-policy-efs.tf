resource "aws_iam_role_policy" "eks-nodegroup-policy-efs" {
  name = "eks-nodegroup-policy-auto-efs"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "elasticfilesystem:*",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-cluster-node-role.id
}
