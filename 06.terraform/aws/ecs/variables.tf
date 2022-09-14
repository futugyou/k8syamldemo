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
  default     = "ngnix"
}

variable "deploy_env" {
  description = "deploy env"
  type        = string
  default     = "Dev"
}

variable "service_name" {
  description = "service name"
  type        = string
  default     = "identity-tf"
}

variable "security_group_name" {
  description = "security group name"
  type        = string
  default     = "onecloud-ecs"
}

variable "subnets_prefix" {
  description = "subnets prefix"
  type        = string
  default     = "private-1"
}

variable "vpc_tag" {
  description = "vpc tag"
  type        = string
  default     = "default"
}

variable "cloud_map_name" {
  description = "cloud map name"
  type        = string
  default     = "terraform.local"
}
