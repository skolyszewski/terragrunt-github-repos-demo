terraform {
  source = "../../modules/repository" # can link to github repo/registry, can be pinned to versions
}

include "root" {
  path = find_in_parent_folders()
}

inputs {
    # organization comes from root terragrunt.hcl, token comes from the one that's one level above
    repo_name = "tg-managed-separate-repo1"
    description = "Repository managed by terragrunt, uses separate modules"
}
