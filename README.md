# terragrunt-github-repos-demo

Just a demo

## Encrypting with sops and age

Generate `age` keys:
`age-keygen -o ~/sops/keys`

Encrypt files:
`sops --encrypt --age <age_pubkey> <filename> > <output_filename>`
