resource "helm_release" "openfaas" {
  repository = "https://openfaas.github.io/faas-netes"
  chart      = "openfaas"
  name       = "openfaas"
  namespace  = "openfaas"
  create_namespace = true

  set {
    name  = "functionNamepsace"
    value = "openfaas-fn"
  }

  set {
    name  = "generateBasicAuth"
    value = "true"
  }

  set {
    name  = "operator.create"
    value = "true"
  }
}