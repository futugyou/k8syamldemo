
resource "helm_release" "aws-load-balancer-controller" {
  name       = "aws-load-balancer-controller"
  depends_on = [null_resource.post-policy]

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"

  set {
    name  = "clusterName"
    value = data.aws_eks_cluster.eks_cluster.name
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "image.repository"
    value = format("%s.dkr.ecr.%s.amazonaws.com/amazon/aws-load-balancer-controller", data.aws_caller_identity.current.account_id, var.default_region)
  }

  set {
    name  = "image.tag"
    value = "v2.4.2"
  }

}

