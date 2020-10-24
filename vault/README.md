# HashiCorp Vault

Vault is a secret management tool 

Used here to for accessing secrets for a variety of uses:

* Terraform Secrets
* CI/CD Secrets
* Runtime Secrets 


Used here with an S3 backend with KMS for auto-unseal.

This is not HA with S3 but is performant enough for test use cases.