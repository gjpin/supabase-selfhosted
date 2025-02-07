# Self-hosted Supabase

# How to
1. Create [Infomaniak account](https://www.infomaniak.com/en) or other Openstack provider
2. Get Openstack credentials (openstack_config.txt). [Guide](https://docs.infomaniak.cloud/getting_started/first_project/connect_project/#__tabbed_4_2)
3. Set Github variables (Settings -> Security -> Secrets and variables -> Actions):
   * OS_AUTH_URL (from openstack_config / openstack RC)
   * OS_PROJECT_DOMAIN_NAME (from openstack_config / openstack RC)
   * OS_USER_DOMAIN_NAME (from openstack_config / openstack RC)
   * OS_IDENTITY_API_VERSION (from openstack_config / openstack RC)
   * OS_INTERFACE (from openstack_config / openstack RC)
4. Set Github secrets  (Settings -> Security -> Secrets and variables -> Actions):
   * OS_PASSWORD (from openstack_config / openstack RC)
   * OS_PROJECT_ID (from openstack_config / openstack RC)
   * OS_PROJECT_NAME (from openstack_config / openstack RC)
   * OS_USERNAME (from openstack_config / openstack RC)
   * PUBLIC_SSH_KEY (cat ~/.ssh/id_ecdsa.pub)

# Other references
## Supabase
* https://supabase.com/docs/guides/self-hosting/docker
## Kong
* https://docs.konghq.com/gateway/latest/install/docker/#start-kong-gateway-in-db-less-mode
* https://github.com/Kong/docker-kong/tree/master/ubuntu
* https://docs.konghq.com/gateway/latest/production/deployment-topologies/db-less-and-declarative-config/
## Kong LetEencrypt
* https://github.com/Kong/go-database-reconciler/blob/main/pkg/file/kong_json_schema.json
* https://github.com/Kong/kong/blob/master/spec/03-plugins/29-acme/04-schema_spec.lua
* https://docs.konghq.com/hub/kong-inc/acme/how-to/redis/
* https://github.com/Razikus/supabase-letsencrypt