resource "aws_ecs_cluster" "ecs" {
  name = var.ecs_name

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  tags = {
    "name" = var.ecs_name
  }
}

resource "aws_ecs_cluster_capacity_providers" "capacity_provider" {
  count = length(var.ecs_providers) > 0 ? 1 : 0

  cluster_name = aws_ecs_cluster.ecs.name

  capacity_providers = var.ecs_providers

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}
