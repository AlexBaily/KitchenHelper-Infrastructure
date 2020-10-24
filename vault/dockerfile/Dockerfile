FROM vault:1.5.4 AS vault

#Copy over config file.
COPY ./config/server-config.hcl /vault/config

RUN vault server