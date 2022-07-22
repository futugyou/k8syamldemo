resource "kubernetes_namespace" "openfaas" {
  lifecycle {
    ignore_changes = [metadata]
  }

  metadata {
    name = var.openfaas_namespace
    labels = {
      role            = "openfaas-system"
      access          = "openfaas-system"
      istio-injection = "enabled"
    }
  }
}

resource "kubernetes_namespace" "openfaas-fn" {
  lifecycle {
    ignore_changes = [metadata]
  }

  metadata {
    name = var.openfaas_fn_namespace
    labels = {
      role            = "openfaas-fn"
      istio-injection = "enabled"
    }
  }
}

resource "helm_release" "openfaas" {
  repository = var.openfaas_charts_url
  chart      = "openfaas"
  name       = "openfaas"
  namespace  = kubernetes_namespace.openfaas.metadata.0.name
  cleanup_on_fail  = true

  depends_on = [kubernetes_namespace.openfaas]

  set {
    name  = "functionNamepsace"
    value = kubernetes_namespace.openfaas-fn.metadata.0.name
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