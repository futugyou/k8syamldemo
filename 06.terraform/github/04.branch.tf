resource "github_branch" "development" {
  repository    = github_repository.apigateway.name
  branch        = "dev"
  source_branch = "master"
}
