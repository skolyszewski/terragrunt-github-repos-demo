# NEEDS TF_VAR_token set

locals {
    organization = "gskolysz"
    # token is loaded from TF_VAR_token
}

module "repository-one" {
    source = "../modules/all-in-one"

    organization = local.organization
    token = var.token
    repo_name = "tf-managed-all-in-one-repo"
    description = "Repository managed by plain terraform, uses all-in-one module"
    protected_branch_pattern = "main"
    enforce_admins = true
    allows_deletions = true
    dismiss_stale_reviews = true
}

module "repository_two" {
    source = "../modules/repository"

    organization = local.organization
    token = var.token
    # Q: WHAT IF I WANT TO USE DIFFERENT TOKEN FOR THIS REPO?
    # A: new variable is needed, or I need to split this into multiple terraform modules :(
    repo_name = "tf-managed-separate-repo"
    description = "Repository managed by plain terraform, uses separate modules"
}

module "repository_two_branch_protection" {
    source = "../modules/branch-protection"

    organization = local.organization
    token = var.token
    repository_id = module.repository_two.repository_id # Uses outputs
    protected_branch_pattern = "main"
    enforce_admins = true
    allows_deletions = true
    dismiss_stale_reviews = true
}
