resource "helm_release" "gocd" {
  repository       = var.gocd_charts_url
  name             = "gocd"
  chart            = "gocd"
  namespace        = var.gocd-namespace
  cleanup_on_fail  = true
  create_namespace = true
}