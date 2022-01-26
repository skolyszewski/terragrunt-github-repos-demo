resource "github_branch_protection" "rule" {
  repository_id = var.repository_id

  pattern          = var.protected_branch_pattern
  enforce_admins   = var.enforce_admins
  allows_deletions = var.allows_deletions

  required_pull_request_reviews {
    dismiss_stale_reviews = var.dismiss_stale_reviews
  }
}
