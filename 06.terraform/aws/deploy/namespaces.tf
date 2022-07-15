resource "kubernetes_namespace" "this" {
  metadata {
    name = "osim-dev"
  }
}