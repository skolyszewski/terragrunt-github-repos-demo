inputs = {
    token = sops_decrypt_file("${get_terragrunt_dir()}/${path_relative_from_include()}/token-org1.txt.enc")
}
