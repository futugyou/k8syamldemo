resource "helm_release" "dapr" {
  repository       = var.dapr_charts_url
  chart            = "dapr"
  name             = "dapr"
  namespace        = var.dapr-namespace
  version          = var.dapr-version
  cleanup_on_fail  = true
  create_namespace = true
}