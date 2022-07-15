resource "kubernetes_config_map" "redis" {    
    data        = {
        "redis.conf" = <<-EOT
            maxmemory 2mb
            maxmemory-policy allkeys-lru
        EOT
    }
    metadata {
        name = "example-redis-config"
        namespace = kubernetes_namespace.this.metadata.0.name
    }
}

resource "kubernetes_service" "redis" {
  metadata {
    name      = "redis-service"
    namespace = kubernetes_namespace.this.metadata.0.name
    labels = {
        app = "redis"
    }
  }
  spec {
    selector = {
      app = "redis"
      appCluster = "redis"
    }
    port {
      name        = "redis-port"
      port        = 6379
      protocol    = "TCP"
      target_port = 6379
    }
  }
} 

resource "kubernetes_deployment" "redis" {
    metadata {
        name             = "redis-service"
        namespace        = kubernetes_namespace.this.metadata.0.name
    }

    spec {
        replicas               = "1"
        selector {
            match_labels = {
                "app"        = "redis"
                "appCluster" = "redis"
            }
        }

        template {
            metadata {
                labels      = {
                    "app"        = "redis"
                    "appCluster" = "redis"
                }
            }

            spec {
                restart_policy                   = "Always"                 

                container {
                    command                    = [
                        "redis-server",
                    ]
                    args                       = [
                        "/redis-master/redis.conf",
                    ]
                    image                      = "redis:5.0.4"
                    image_pull_policy          = "IfNotPresent"
                    name                       = "redis"

                    port {
                        container_port = 6379
                        name           = "redis"
                        protocol       = "TCP"
                    }
                    port {
                        container_port = 16379
                        name           = "cluster"
                        protocol       = "TCP"
                    }

                    resources {
                        limits   = {}
                        requests = {
                            "cpu"    = "100m"
                            "memory" = "100Mi"
                        }
                    }

                    volume_mount {
                        mount_path = "/redis-master-data"
                        name       = "data"
                    }
                    volume_mount {
                        mount_path = "/redis-master"
                        name       = "config"
                    }
                }
                volume {
                    name = "config"
                    config_map {
                        name     = "example-redis-config"
                        items {
                            key  = "redis.conf"
                            path = "redis.conf"
                        }
                    }
                }
                volume {
                    name = "data"
                    empty_dir {}
                }
            }
        }
    }
}