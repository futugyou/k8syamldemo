provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "pkslow-nginx" {
    source = "../module"
    namespace = "pkslow"
    applicationName = "pkslow-nginx"
    image = "nginx:1.19.5"
    replicas = 3
    nodePort = 30301
}