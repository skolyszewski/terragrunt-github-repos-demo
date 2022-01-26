resource "github_repository" "repo" {
  name        = var.repo_name
  description = var.description
}

resource "github_branch_protection" "rule" {
  repository_id = github_repository.repo.node_id

  pattern          = var.protected_branch_pattern
  enforce_admins   = var.enforce_admins
  allows_deletions = var.allows_deletions

  required_pull_request_reviews {
    dismiss_stale_reviews = var.dismiss_stale_reviews
  }
}
