resource "aws_iam_role_policy" "eks-nodegroup-policy-ec2" {
  name = "eks-nodegroup-policy-auto-ec2"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "ec2:DescribeSubnets",
            "ec2:CreateNetworkInterface",
            "ec2:DescribeNetworkInterfaces",
            "ec2:DeleteNetworkInterface",
            "ec2:ModifyNetworkInterfaceAttribute",
            "ec2:DescribeNetworkInterfaceAttribute",
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
