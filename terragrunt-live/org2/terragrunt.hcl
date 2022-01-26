terraform {
    before_hook "sops_decrypt_token" {
    commands     = ["apply", "plan"]
    execute      = ["sops", "--decrypt", "token-org2.txt.enc", ">", "token-org2.txt.decrypted"]
  }
}

include "root" {
    path = find_in_parent_folders()
}

inputs {
    token = file("./token-org2.txt.decrypted")
    # organization comes from root terragrunt.hcl, token comes from the one that's one level above
    protected_branch_pattern = "main"
    enforce_admins = true
    allows_deletions = true
    dismiss_stale_reviews = true
}
