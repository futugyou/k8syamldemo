resource "kubernetes_config_map" "redis-cluster" {    
    data        = {
        "redis.conf" = <<-EOT
            appendonly yes
            cluster-enabled yes
            cluster-config-file /var/lib/redis/nodes.conf
            cluster-node-timeout 5000
            dir /var/lib/redis
            port 6379
        EOT
    }
    metadata {
        name = "redis-cluster-conf"
        namespace = kubernetes_namespace.this.metadata.0.name
    }
}

resource "kubernetes_service" "redis-cluster-headless" {
  metadata {
    name      = "redis-cluster-service"
    namespace = kubernetes_namespace.this.metadata.0.name
    labels = {
        app = "redis-cluster"
    }
  }
  spec {
    selector = {
      app = "redis-cluster"
      appCluster = "redis-cluster"
    }
    cluster_ip = "None"
    port {
      name = "redis-port"
      port = 6379
    }
  }
} 

resource "kubernetes_service" "redis-cluster" {
  metadata {
    name      = "gold-redis"
    namespace = kubernetes_namespace.this.metadata.0.name
    labels = {
        app = "redis-cluster"
    }
  }
  spec {
    selector = {
      app = "redis-cluster"
      appCluster = "redis-cluster"
    }
    port {
      name        = "redis-port"
      port        = 6379
      protocol    = "TCP"
      target_port = 6379
    }
  }
} 

resource "kubernetes_stateful_set" "redis-cluster" {
    metadata {
        name             = "redis-cluster-app"
        namespace        = kubernetes_namespace.this.metadata.0.name
    }

    spec {
        replicas               = "3"
        service_name           = "redis-cluster-service"
        selector {
            match_labels = {
                "app"        = "redis-cluster"
                "appCluster" = "redis-cluster"
            }
        }

        template {
            metadata {
                labels      = {
                    "app"        = "redis-cluster"
                    "appCluster" = "redis-cluster"
                }
            }

            spec {
                restart_policy                   = "Always"
                termination_grace_period_seconds = 20

                affinity {
                    pod_anti_affinity {
                        preferred_during_scheduling_ignored_during_execution {
                            weight = 100

                            pod_affinity_term {
                                topology_key = "kubernetes.io/hostname"

                                label_selector {
                                    match_expressions {
                                        key      = "app"
                                        operator = "In"
                                        values   = [
                                            "redis-cluster",
                                        ]
                                    }
                                }
                            }
                        }
                    }
                }

                container {
                    args                       = [
                        "/etc/redis/redis.conf",
                        "--protected-mode",
                        "no",
                    ]
                    command                    = [
                        "redis-server",
                    ]
                    image                      = "registry.cn-qingdao.aliyuncs.com/gold-faas/gold-redis:1.0"
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
                        mount_path = "/etc/redis"
                        name       = "redis-conf"
                        read_only  = false
                    }
                    volume_mount {
                        mount_path = "/var/lib/redis"
                        name       = "redis-data"
                        read_only  = false
                    }
                }

                volume {
                    name = "redis-conf"
                    config_map {
                        name     = "redis-cluster-conf"
                        items {
                            key  = "redis.conf"
                            path = "redis.conf"
                        }
                    }
                }
                volume {
                    name = "redis-data"
                    empty_dir {}
                }
            }
        }
    }
}