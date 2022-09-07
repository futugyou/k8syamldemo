resource "aws_eks_cluster" "cluster" {
  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler",
  ]
  name = var.cluster-name

  role_arn = data.aws_iam_role.cluster_service_role.arn
  tags     = {}
  version  = var.cluster_version

  timeouts {}

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = false
    public_access_cidrs = [
      "0.0.0.0/0",
    ]
    security_group_ids = data.aws_security_groups.cluster-sg.ids

    subnet_ids = data.aws_subnets.cluster-private.ids
  }
  encryption_config {
    provider {
      key_arn = aws_kms_key.ekskey.arn
    }
    resources = ["secrets"]
  }

}
