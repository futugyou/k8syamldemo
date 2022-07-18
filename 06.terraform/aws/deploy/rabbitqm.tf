resource "kubernetes_service" "rabbitmq" {
  metadata {
    name      = "rabbitmq-service"
    namespace = kubernetes_namespace.this.metadata.0.name
    labels = {
        app = "rabbitmq"
    }
  }
  spec {
    selector = {
      app = "rabbitmq"
      appCluster = "rabbitmq"
    }
    port {
      name        = "rabbitmq-port"
      port        = 5672
      target_port = "rabbitmq-http"
    }
  }
} 

resource "kubernetes_deployment" "rabbitmq" {
    metadata {
        name             = "rabbitmq-service"
        namespace        = kubernetes_namespace.this.metadata.0.name
    }

    spec {
        replicas               = "1"
        selector {
            match_labels = {
                "app"        = "rabbitmq"
                "appCluster" = "rabbitmq"
            }
        }

        template {
            metadata {
                labels      = {
                    "app"        = "rabbitmq"
                    "appCluster" = "rabbitmq"
                }
            }

            spec {
                container {
                    image                      = "rabbitmq:3-management-alpine"
                    image_pull_policy          = "IfNotPresent"
                    name                       = "rabbitmq"

                    port {
                        container_port = 5672
                        name           = "rabbitmq-http"
                        protocol       = "TCP"
                    }
                }
            }
        }
    }
}