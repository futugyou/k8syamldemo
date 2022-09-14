variable "default_region" {
  description = "cluster region"
  type        = string
  default     = "ap-southeast-1"
}

variable "ecs_name" {
  description = "ecs name"
  type        = string
  default     = "terraform-ecs"
}

variable "ecs_providers" {
  description = "ecs capacity providers"
  type        = list(string)
  default     = ["FARGATE", "FARGATE_SPOT"]
}

variable "task_role" {
  description = "task role"
  type        = string
  default     = "OneCloudECSFullAccess"
}

variable "execution_role" {
  description = "execution role"
  type        = string
  default     = "ecsTaskExecutionRole"
}

variable "task_definition_name" {
  description = "task definition name"
  type        = string
  default     = "identity-tf"
}

variable "otel_config_name" {
  description = "otel config name"
  type        = string
  default     = "OSIM.OneApp.APIGateway.OtelCollectorConfig"
}

variable "task_image_name" {
  description = "task image name"
  type        = string
  default     = "383796595686.dkr.ecr.ap-southeast-1.amazonaws.com/oneapp-apigateway:28a55e3a0ea0254f5fa78c25573f0754ba6c049b"
}

variable "deploy_env" {
  description = "deploy env"
  type        = string
  default     = "Dev"
}
