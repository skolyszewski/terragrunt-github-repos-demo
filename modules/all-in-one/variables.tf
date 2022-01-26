variable "organization" {
  type        = string
  description = ""
}

variable "token" {
  type        = string
  description = "This is the target GitHub organization or individual user account to manage"
}

variable "repo_name" {
  description = "Repository name"
  type        = string
}

variable "description" {
  description = "Repository description"
  type        = string
}

variable "protected_branch_pattern" {
  description = "Branch pattern to protect with the rule"
  type        = string
}

variable "enforce_admins" {
  description = "Enforce admins"
  type        = bool
}

variable "allows_deletions" {
  description = "Allow deletions (whatever that means)"
  type        = bool
}

variable "dismiss_stale_reviews" {
  description = "Dismiss stale reviews"
  type        = bool
}