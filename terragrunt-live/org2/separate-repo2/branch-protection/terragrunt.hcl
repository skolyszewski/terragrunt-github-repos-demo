terraform {
  source = "../../modules/branch-protection" # can link to github repo/registry, can be pinned to versions
}

include "root" {
  path = find_in_parent_folders()
}

dependency "repo" {
    config_path = "../repository"
}

inputs {
    repository_id = dependency.repo.outputs.repository_id # note .outputs
    # organization comes from root terragrunt.hcl, token comes from the one that's one level above
    allows_deletions = false
    dismiss_stale_reviews = false
}
