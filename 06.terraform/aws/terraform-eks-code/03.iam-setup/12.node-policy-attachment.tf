resource "aws_iam_role_policy_attachment" "node-policy-attachment-ecr" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-cluster-node-role.id
}

resource "aws_iam_role_policy_attachment" "node-policy-attachment-ssm" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  role       = aws_iam_role.eks-cluster-node-role.id
}

resource "aws_iam_role_policy_attachment" "node-policy-attachment-node" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks-cluster-node-role.id
}

resource "aws_iam_role_policy_attachment" "node-policy-attachment-cni" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks-cluster-node-role.id
}

resource "aws_iam_role_policy_attachment" "node-policy-attachment-ssmi" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.eks-cluster-node-role.id
}

resource "aws_iam_role_policy_attachment" "node-policy-attachment-cloud-watch" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role       = aws_iam_role.eks-cluster-node-role.id
}
