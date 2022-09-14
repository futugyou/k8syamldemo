resource "aws_ecs_service" "service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.ecs.id
  task_definition = aws_ecs_task_definition.task.arn


  deployment_maximum_percent         = "200"
  deployment_minimum_healthy_percent = "100"
  desired_count                      = 1
  enable_ecs_managed_tags            = "true"
  enable_execute_command             = "false"

  health_check_grace_period_seconds = "0"
  platform_version                  = "LATEST"
  scheduling_strategy               = "REPLICA"

  deployment_circuit_breaker {
    enable   = "false"
    rollback = "false"
  }

  deployment_controller {
    type = "ECS"
  }

  network_configuration {
    assign_public_ip = "false"
    security_groups  = [data.aws_security_group.ecs_security.id]
    subnets          = data.aws_subnets.private_subnet.ids
  }
}
