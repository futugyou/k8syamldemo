resource "kubernetes_service" "mssql" {
  metadata {
    name      = "mssql-service"
    namespace = kubernetes_namespace.this.metadata.0.name
    labels = {
        app = "mssql"
    }
  }
  spec {
    selector = {
      app = "mssql"
      appCluster = "mssql"
    }
    port {
      name        = "mssql-port"
      port        = 1433
      protocol    = "TCP"
      target_port = 1433
    }
  }
} 

resource "kubernetes_deployment" "mssql" {
    metadata {
        name             = "mssql-service"
        namespace        = kubernetes_namespace.this.metadata.0.name
    }

    spec {
        replicas               = "1"
        selector {
            match_labels = {
                "app"        = "mssql"
                "appCluster" = "mssql"
            }
        }

        template {
            metadata {
                labels      = {
                    "app"        = "mssql"
                    "appCluster" = "mssql"
                }
            }

            spec {
                container {
                    image                      = "mcr.microsoft.com/azure-sql-edge"
                    image_pull_policy          = "IfNotPresent"
                    name                       = "mssql"

                    port {
                        container_port = 1433
                        name           = "mssql"
                        protocol       = "TCP"
                    }

                    env {
                        name  = "SA_PASSWORD"
                        value = "Pass@word"
                    }
                    env {
                        name  = "ACCEPT_EULA"
                        value = "Y"
                    }
                }
            }
        }
    }
}