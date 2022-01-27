terraform {
    before_hook "sops_decrypt_token" {
        commands = ["apply", "plan"]
        execute  = [
            "sops",
            "--decrypt",
            "${get_terragrunt_dir()}/${path_relative_from_include()}/token-org2.txt.enc",
            ">",
            "${get_terragrunt_dir()}/${path_relative_from_include()}/token-org2.txt.decrypted"
        ]
    }
}

inputs = {
    token = file("token-org2.txt.decrypted")
    protected_branch_pattern = "main"
    enforce_admins = true
    allows_deletions = true
    dismiss_stale_reviews = true
}
