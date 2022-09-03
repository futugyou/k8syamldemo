resource "aws_iam_role_policy" "eks-cluster-policy-metrics-permissions" {
  name = "eks-cluster-policy-metrics-permissions"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "cloudwatch:PutMetricData",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-cluster-service-role.id
}
