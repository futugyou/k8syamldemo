data "aws_iam_role" "task_role" {
  name = var.task_role
}

data "aws_iam_role" "execution_role" {
  name = var.execution_role
}

data "aws_security_group" "ecs_security" {
  name = var.security_group_name
}

data "aws_subnets" "private_subnet" {
  filter {
    name   = "tag:Name"
    values = [format("%s*", var.subnets_prefix)]
  }
}

data "aws_vpc" "ecs_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_tag]
  }
}
