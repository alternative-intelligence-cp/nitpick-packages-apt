#!/bin/bash
# Publish the APT repository to the web server
set -e

REPO_BASE="${REPO_BASE:-/var/lib/nitpick-apt}"
DEPLOY_HOST="${DEPLOY_HOST:-packages.npker.ai-liberation-platform.org}"
DEPLOY_PATH="${DEPLOY_PATH:-/var/www/packages}"
DEPLOY_USER="${DEPLOY_USER:-root}"

echo "Publishing APT repository to ${DEPLOY_HOST}..."

rsync -avz --delete \
    "${REPO_BASE}/dists/" \
    "${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PATH}/dists/"

rsync -avz --delete \
    "${REPO_BASE}/pool/" \
    "${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PATH}/pool/"

# Copy the keyring
rsync -avz \
    "$(dirname "${BASH_SOURCE[0]}")/../keys/nitpick-archive-keyring.gpg" \
    "${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PATH}/"

echo "Published to https://${DEPLOY_HOST}/"
