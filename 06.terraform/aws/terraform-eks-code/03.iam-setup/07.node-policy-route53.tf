resource "aws_iam_role_policy" "eks-nodegroup-policy-route53-change" {
  name = "eks-nodegroup-policy-route53-change"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "route53:ChangeResourceRecordSets",
          ]
          Effect   = "Allow"
          Resource = "arn:aws:route53:::hostedzone/*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-cluster-node-role.id
}

resource "aws_iam_role_policy" "eks-nodegroup-policy-route53-change-get" {
  name = "eks-nodegroup-policy-route53-change-get"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "route53:GetChange",
          ]
          Effect   = "Allow"
          Resource = "arn:aws:route53:::change/*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-cluster-node-role.id
}

resource "aws_iam_role_policy" "eks-nodegroup-policy-route53-zone" {
  name = "eks-nodegroup-policy-route53-zone"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "route53:ListResourceRecordSets",
            "route53:ListHostedZonesByName",
            "route53:ListHostedZones",
            "route53:ListTagsForResource",
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
