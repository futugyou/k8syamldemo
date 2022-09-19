resource "github_repository" "apigateway" {
  name                   = "APIGateway"
  visibility             = "private"
  allow_auto_merge       = false
  allow_merge_commit     = true
  allow_rebase_merge     = false
  allow_squash_merge     = false
  has_issues             = true
  delete_branch_on_merge = true
  auto_init              = true
  gitignore_template     = "VisualStudio"
  license_template       = "mit"
}

// can not add to private repo
# resource "github_branch_protection" "apigateway" {
#   repository_id = github_repository.apigateway.node_id

#   pattern          = "master"
#   enforce_admins   = true
#   allows_deletions = false

#   required_status_checks {
#     strict = true
#   }

#   required_pull_request_reviews {
#     dismiss_stale_reviews           = true
#     required_approving_review_count = 1
#   }

# }

# resource "github_repository_file" "gitignore" {
#   repository          = github_repository.apigateway.name
#   branch              = "master"
#   file                = ".gitignore"
#   content             = "**/*.tfstate"
#   commit_message      = "Managed by Terraform"
#   commit_author       = "Terraform User"
#   commit_email        = "terraform@example.com"
#   overwrite_on_create = true
# }

resource "github_issue_label" "apigateway" {
  repository = github_repository.apigateway.id
  count      = length(var.issue_labels)
  name       = element(keys(var.issue_labels), count.index)
  color      = element(values(var.issue_labels), count.index)
}


resource "github_repository" "public_repo" {
  name                   = "public_repo_demo"
  visibility             = "public"
  allow_auto_merge       = false
  allow_merge_commit     = true
  allow_rebase_merge     = false
  allow_squash_merge     = false
  has_issues             = true
  delete_branch_on_merge = true
  auto_init              = true
  gitignore_template     = "VisualStudio"
  license_template       = "mit"
}
