terraform {
  source = "../../..//modules/all-in-one" # can link to github repo/registry, can be pinned to versions
}

include "root" {
  path = find_in_parent_folders()
}

include "org-specific" {
  path = find_in_parent_folders("org-specific.hcl")
}

inputs = {
    repo_name = "tg-managed-all-in-one-repo"
    description = "Repository managed by terragrunt, uses all-in-one module"
    protected_branch_pattern = "main"
    enforce_admins = true
    allows_deletions = true
    dismiss_stale_reviews = true
}
