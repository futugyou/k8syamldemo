resource "helm_release" "dapr" {
  repository       = "https://dapr.github.io/helm-charts/"
  chart            = "dapr"
  name             = "dapr"
  namespace        = "dapr-system"
  create_namespace = true
}