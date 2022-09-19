resource "github_repository_webhook" "webhook" {
  repository = github_repository.apigateway.name

  configuration {
    url          = var.webhook_url
    content_type = "form"
    insecure_ssl = false
  }

  active = false

  events = ["issues"]
}
