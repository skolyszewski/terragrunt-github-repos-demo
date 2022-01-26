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
