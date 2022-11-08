resource "null_resource" "load_ecr" {
  triggers = {
    file_content_md5 = md5(file("${path.module}/shell/docker-push.sh"))
  }

  depends_on = [aws_ecr_repository.ecr_repository]

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = "sh ${path.module}/shell/docker-push.sh"

    environment = {
      AWS_REGION     = var.default_region
      AWS_ACCOUNT_ID = data.aws_caller_identity.current.account_id
      REPO_URL       = aws_ecr_repository.ecr_repository.repository_url
      CONTAINER_NAME = var.ecr_repository_name
    }
  }
}

data "aws_caller_identity" "current" {}
