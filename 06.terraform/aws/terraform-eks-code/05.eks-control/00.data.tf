data "aws_iam_role" "cluster_service_role" {
  name = "eks-cluster-service-role"
}

data "aws_security_groups" "cluster-sg" {
  tags = {
    "Name" = format("%s-cluster/ControlPlaneSecurityGroup", var.cluster-name)
  }
}

data "aws_subnets" "cluster-private" {
  filter {
    name   = "tag:Name"
    values = [format("%s-private-*", var.cluster-name)]
  }
}
