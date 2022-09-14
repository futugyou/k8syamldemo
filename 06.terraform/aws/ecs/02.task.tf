resource "aws_ecs_task_definition" "task" {
  family = var.task_definition_name

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  task_role_arn            = data.aws_iam_role.task_role.arn
  execution_role_arn       = data.aws_iam_role.execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "aws-otel-collector"
      image     = "public.ecr.aws/aws-observability/aws-otel-collector:latest"
      essential = true
      environment = [
        {
          name  = "AWS_REGION"
          value = var.default_region
        }
      ]
      secrets = [{
        name      = "AOT_CONFIG_CONTENT"
        valueFrom = var.otel_config_name
      }]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = format("ecs/%s", var.task_definition_name)
          awslogs-region        = var.default_region
          awslogs-stream-prefix = "ecs"
        }
      }
    },

    {
      name      = var.task_definition_name
      image     = var.task_image_name
      essential = true
      environment = [
        {
          name  = "ASPNETCORE_ENVIRONMENT"
          value = var.deploy_env
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = format("/ecs/%s", var.task_definition_name)
          awslogs-region        = var.default_region
          awslogs-stream-prefix = "ecs"
        }
      }
      portMappings = [{
        containerPort = 80
        hostPort      = 80
        protocol      = "tcp"
      }]
    }
  ])
}
