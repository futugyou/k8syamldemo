resource "aws_service_discovery_private_dns_namespace" "cloudmap" {
  name = var.cloud_map_name
  vpc  = data.aws_vpc.ecs_vpc.id
}

resource "aws_service_discovery_service" "discovery_service" {
  name = var.service_name

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.cloudmap.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "WEIGHTED"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}
