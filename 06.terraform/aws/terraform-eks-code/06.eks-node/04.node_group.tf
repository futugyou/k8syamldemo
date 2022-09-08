
resource "aws_eks_node_group" "node_group" {
  #ami_type       = "AL2_x86_64"
  depends_on = [aws_launch_template.node-template]

  cluster_name   = var.cluster-name
  disk_size      = 0
  instance_types = []
  labels = {
    "eks/cluster-name"   = var.cluster-name
    "eks/nodegroup-name" = format("ng1-%s", var.cluster-name)
  }
  node_group_name = format("ng1-%s", var.cluster-name)
  node_role_arn   = data.aws_iam_role.node-role.arn

  subnet_ids = data.aws_subnets.cluster-private.ids

  tags = {
    "eks/cluster-name"                            = var.cluster-name
    "eks/nodegroup-name"                          = format("ng1-%s", var.cluster-name)
    "eks/nodegroup-type"                          = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = var.cluster-name
  }
  #version = "1.17"

  launch_template {
    name    = aws_launch_template.node-template.name
    version = "1"
  }

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  timeouts {}
}
