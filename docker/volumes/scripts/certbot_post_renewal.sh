#!/usr/bin/env bash
set -e

# References:
# https://docs.konghq.com/gateway/api/admin-ee/latest/#/operations/create-certificate

# The “live” directory for your ACME_DOMAIN
CERT_DIR="/etc/letsencrypt/live/${ACME_DOMAIN}"

# Upload the renewed cert & key to Kong
curl -X POST "http://kong:8001/certificates" \
  --form "cert=@${CERT_DIR}/fullchain.pem" \
  --form "key=@${CERT_DIR}/privkey.pem" \
  --form "snis[]=${ACME_DOMAIN}" \
  --form "snis[]=\*.${ACME_DOMAIN}" \
  --silent --show-error --fail

echo "✅ Pushed renewed certificate for ${ACME_DOMAIN} to Kong"
