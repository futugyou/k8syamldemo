data "aws_iam_role" "task_role" {
  name = var.task_role
}

data "aws_iam_role" "execution_role" {
  name = var.execution_role
}
