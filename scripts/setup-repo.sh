#!/bin/bash
# Set up the Nitpick APT repository on a user's machine
set -e

REPO_URL="${REPO_URL:-https://packages.npker.ai-liberation-platform.org}"
DISTRIBUTION="${DISTRIBUTION:-noble}"

echo "Setting up Nitpick package repository..."

# Download and install GPG key
curl -fsSL "${REPO_URL}/nitpick-archive-keyring.gpg" | \
    sudo gpg --dearmor -o /usr/share/keyrings/nitpick-archive-keyring.gpg

# Add repository
echo "deb [signed-by=/usr/share/keyrings/nitpick-archive-keyring.gpg] ${REPO_URL} ${DISTRIBUTION} main" | \
    sudo tee /etc/apt/sources.list.d/nitpick.list > /dev/null

# Update
sudo apt-get update

echo ""
echo "Nitpick repository configured!"
echo ""
echo "Available packages:"
echo "  nitpick              - Nitpick compiler, LSP, stdlib"
echo "  nitpick-tools        - Safety audit, MCP server"
echo "  nitpick-man-pages    - Man pages"
echo "  nitpick-packages     - Ecosystem packages"
echo ""
echo "Install with: sudo apt install nitpick"
