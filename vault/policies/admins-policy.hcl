#############################
# Vault Policies for Admins #
#############################

#Give admins access to all secrets
path "secret/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}