resource "aws_iam_role_policy_attachment" "cluster-policy-attachment-eks" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-cluster-service-role.id
}

resource "aws_iam_role_policy_attachment" "cluster-policy-attachment-vpc" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks-cluster-service-role.id
}
