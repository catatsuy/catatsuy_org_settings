#!/bin/bash
set -euo pipefail

EMAIL="catatsuy@catatsuy.org"
#SERVER="https://acme-staging-v02.api.letsencrypt.org/directory"
SERVER='https://acme-v02.api.letsencrypt.org/directory'

/usr/local/bin/lego \
  --accept-tos \
  --email "$EMAIL" \
  --server "$SERVER" \
  --path /home/www/lego/ecdsa \
  --dns route53 \
  --key-type ec384 \
  --domains catatsuy.org \
  --domains www.catatsuy.org \
  --domains blog.catatsuy.org \
  --domains ech.catatsuy.org \
  run \
  --profile shortlived

cat /home/www/lego/ecdsa/certificates/catatsuy.org.crt \
    /home/www/lego/ecdsa/certificates/catatsuy.org.issuer.crt \
    > /home/www/lego/ecdsa/certificates/catatsuy.org.fullchain.pem

/usr/local/bin/lego \
  --accept-tos \
  --email "$EMAIL" \
  --server "$SERVER" \
  --path /home/www/lego/ecdsa \
  --dns route53 \
  --key-type ec384 \
  --domains matw.co \
  run \
  --profile shortlived

cat /home/www/lego/ecdsa/certificates/matw.co.crt \
    /home/www/lego/ecdsa/certificates/matw.co.issuer.crt \
    > /home/www/lego/ecdsa/certificates/matw.co.fullchain.pem

