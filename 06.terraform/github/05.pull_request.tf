resource "github_repository_pull_request" "pull_request" {
  base_repository = "APIGateway"
  base_ref        = "master"
  head_ref        = "dev"
  title           = "test bot"
  body            = "This will change everything"
}
