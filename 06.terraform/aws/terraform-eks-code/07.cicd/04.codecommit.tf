resource "aws_codecommit_repository" "eksworkshop-app" {
  repository_name = var.cluster-name
  description     = "This is the Sample App Repository"
}
