inputs = {
    token = sops_decrypt_file("${get_terragrunt_dir()}/../token-org1.txt.enc")
}
