# terragrunt-github-repos-demo

Showcase the power of terragrunt on a simple example.

# Preparing for running

To run the code, we need secrets: github's personal access token(s).
Following section explains how to encrypt them
once they are configured in your github account.

## Encrypting with sops and age

The repo uses [mozilla/sops](https://github.com/mozilla/sops) and [FiloSottile/age](https://github.com/FiloSottile/age)
to encrypt secrets. To run the example, you need to install both of them (although, you don't need `sops` when using
`sops_decrypt_file()`).

To generate `age` keys, and copy them to the directory used by sops in terragrunt:

``` bash
age-keygen -o ~/sops/keys
mkdir -p ~/.config/sops/age
cp ~/sops/keys/keys.txt ~/.config/sops/age/keys.txt
```

To encrypt secrets so they work with the example:

```
sops --encrypt --age $AGE_PUBKEY $DECRYPTED_FILENAME > $ENCRYPTED_FILENAME
```

# Running the examples

You can start with exploring and running plain-terraform example, which can be found in `terraform-live`.
Navigate to the directory, export your github token into `TF_VAR_token` and run `terraform init` and 
`terraform plan/apply`. You should end up having 2 repositories, with branch protection rule added.

Then, to see terragrunt-managed example, navigate to `terragrunt-live`. From there, you can either run
`terragrunt run-all plan/apply` (doesn't require init!), or enter specific parts of the setup and run them
independently, e.g. `cd org1/all-in-one` and `terragrunt plan`.

The result should be roughly the same (depends on if the variables are the same for both approaches), but
you should see the way you achieve it is **way** different.
