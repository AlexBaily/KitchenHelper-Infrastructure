##############################
# Vault Server Configuration #
##############################

#Backed by S3 so we can run on ECS and don't have to use consul.
#Not worried about HA for use case, would transfer to DynamoDB for HA.
storage "s3" {
  region     = "eu-west-1"
  bucket     = "kitchenhelper-vault"
}

#Listen on 8200 (Default Vault port).
listener "tcp" {
  address     = "127.0.0.1:8200"
  tls_disable = 1
}


#Use KMS for the seal so we can get auto-unseal going.
seal "awskms" {
    region = "eu-west-1"
    kms_key_id = "${KMS_KEY_ID}"
}

#Enable the UI.
ui = true