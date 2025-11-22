#!/usr/bin/env bash
set -euo pipefail

REMOTE_BIN=/home/catatsuy/easerver_linux
SERVICE=easerver.service

scp easerver_linux "catatsuy.org:${REMOTE_BIN}.new"

ssh "catatsuy.org" "
  mv ${REMOTE_BIN}.new ${REMOTE_BIN}
"
