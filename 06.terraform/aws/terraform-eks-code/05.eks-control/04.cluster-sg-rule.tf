resource "aws_security_group_rule" "eks-add-clustersg" {
  for_each                 = toset(data.aws_security_groups.cluster-sg.ids)
  
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id
  security_group_id        = each.value
}
