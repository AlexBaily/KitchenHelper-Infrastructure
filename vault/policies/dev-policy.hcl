###########################
# Vault Policies for Devs #
###########################

#Give devs access to dev environment secrets.
path "secret/dev" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

#Explicit deny on prod because why not.
path "secret/prod" {
    capabilities  = ["deny"]
}