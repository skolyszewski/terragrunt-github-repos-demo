include "root" {
  path = find_in_parent_folders()
}

inputs {
    token = sops.decrypt_file("token-org1.txt.enc")
}
