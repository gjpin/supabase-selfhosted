# Self-hosted Supabase

# Features
* Postgres vector extension (pgvector) enabled by default
* Let's Encrypt certificate (Kong ACME plugin)
* Vector [fix backported](https://github.com/supabase/supabase/pull/28931)
* All container images updated to latest version
   ** Kong bumped to v3

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

# How to fill .env
[Supabase's documentation](https://supabase.com/docs/guides/self-hosting/docker#securing-your-services)

* VAULT_ENC_KEY
   ** `openssl rand -base64 24`
   ** Should be 32 as per [documentation](https://github.com/supabase/supavisor/pull/329) 
* POSTGRES_PASSWORD / DASHBOARD_PASSWORD / SECRET_KEY_BASE / LOGFLARE_LOGGER_BACKEND_API_KEY / LOGFLARE_API_KEY
   ** `openssl rand -hex 40` (or other size)
* DASHBOARD_USERNAME
   ** Your dashboard username
* JWT_SECRET / ANON_KEY / SERVICE_ROLE_KEY
   ** python scripts/create_tokens.py
   ** Script will print out those 3 variables, in order
* SITE_URL / API_EXTERNAL_URL / SUPABASE_PUBLIC_URL
   ** Your domain. eg. https://supabase.example.com
* STUDIO_DEFAULT_ORGANIZATION
   ** Default organization name
* STUDIO_DEFAULT_PROJECT
   ** Default project name
* ACME_EMAIL
   ** Your email. eg. example@example.com
* ACME_DOMAIN
   ** Your domain. eg. https://supabase.example.com

# Supabase URLs
* Auth providers: https://supabase.example.com/project/default/auth/providers
* Vault:
   * https://supabase.example.com/project/default/editor?schema=vault
   * https://supabase.com/docs/guides/database/vault#using-the-vault

# References
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