##################
# Vault Policies #
##################


These HashiCorp Vault policies are used to determine what certain groups of users are able to do in Vault.

This includes what secrets they can access and manage.


Policies are created and applied via Vault CLI: .e.g.

Creation:

`vault policy write admin-policy admin-policy.hcl`

Applying to a GitHub team:

`vault write /auth/github/map/teams/admins value=admin-policy`

