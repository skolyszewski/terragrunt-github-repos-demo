inputs = {
    organization = yamldecode(find_in_parent_folders("organization.yaml", "empty.yaml"))
    token = sops_decrypt_file("${get_terragrunt_dir()}/../token-org1.txt.enc")
}
