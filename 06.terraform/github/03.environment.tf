data "github_user" "current" {
  username = ""
}

resource "github_repository_environment" "environment" {
  environment = "only_public_repo_have_environment"
  repository  = github_repository.public_repo.name
  reviewers {
    users = [data.github_user.current.id]
  }
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }
}
