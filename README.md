# terragrunt-github-repos-demo

Showcase the power of terragrunt on a simple example.

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
