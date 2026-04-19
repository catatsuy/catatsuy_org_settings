#!/bin/bash
set -euo pipefail

EMAIL="catatsuy@catatsuy.org"
#SERVER="https://acme-staging-v02.api.letsencrypt.org/directory"
SERVER='https://acme-v02.api.letsencrypt.org/directory'

/usr/local/bin/lego \
  --accept-tos \
  --email "$EMAIL" \
  --server "$SERVER" \
  --path /home/www/lego/rsa \
  --dns route53 \
  --key-type rsa2048 \
  --domains catatsuy.org \
  --domains www.catatsuy.org \
  --domains blog.catatsuy.org \
  --domains ech.catatsuy.org \
  run \
  --profile shortlived

cat /home/www/lego/rsa/certificates/catatsuy.org.crt \
    /home/www/lego/rsa/certificates/catatsuy.org.issuer.crt \
    > /home/www/lego/rsa/certificates/catatsuy.org.fullchain.pem

/usr/local/bin/lego \
  --accept-tos \
  --email "$EMAIL" \
  --server "$SERVER" \
  --path /home/www/lego/rsa \
  --dns route53 \
  --key-type rsa2048 \
  --domains matw.co \
  run \
  --profile shortlived

cat /home/www/lego/rsa/certificates/matw.co.crt \
    /home/www/lego/rsa/certificates/matw.co.issuer.crt \
    > /home/www/lego/rsa/certificates/matw.co.fullchain.pem

