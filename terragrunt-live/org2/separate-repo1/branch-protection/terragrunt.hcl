terraform {
  source = "../../../..//modules/branch-protection" # can link to github repo/registry, can be pinned to versions
}

include "root" {
  path = find_in_parent_folders()
}

include "org-specific" {
  path = find_in_parent_folders("org-specific.hcl")
}

dependency "repo" {
    config_path = "../repository"
}

inputs = {
    repository_id = dependency.repo.outputs.repository_id # note .outputs
    # organization comes from root terragrunt.hcl, token comes from the one that's one level above
    protected_branch_pattern = "main"
    enforce_admins = true
    allows_deletions = true
    dismiss_stale_reviews = true
}
