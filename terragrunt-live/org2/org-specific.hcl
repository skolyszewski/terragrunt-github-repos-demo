terraform {
    before_hook "sops_decrypt_token" {
        commands = ["apply", "plan"]
        execute  = ["sops", "--decrypt", "${dirname(dirname(get_terragrunt_dir()))}/token-org2.txt.enc", ">", "../../token-org2.txt.decrypted"]
  }
}

inputs = {
    token = file("token-org2.txt.decrypted")
    protected_branch_pattern = "main"
    enforce_admins = true
    allows_deletions = true
    dismiss_stale_reviews = true
}
