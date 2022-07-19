resource "helm_release" "istio_base" {
  repository       = var.istio_charts_url
  chart            = "base"
  name             = "istio-base"
  namespace        = var.istio-namespace
  version          = var.istio-version
  create_namespace = true
  cleanup_on_fail = true
}

resource "helm_release" "istiod" {
  repository       = var.istio_charts_url
  chart            = "istiod"
  name             = "istiod"
  cleanup_on_fail = true
  namespace        = var.istio-namespace
  create_namespace = true
  version          = var.istio-version
  depends_on       = [helm_release.istio_base]
}

resource "kubernetes_namespace" "istio-ingress" {
  metadata {
    labels = {
      istio-injection = "enabled"
    }

    name = "istio-ingress"
  }
}

resource "helm_release" "istio-ingress" {
  repository = var.istio_charts_url
  chart      = "gateway"
  name       = "istio-ingress"
  namespace  = kubernetes_namespace.istio-ingress.id
  version    = var.istio-version
  depends_on = [helm_release.istiod]
}