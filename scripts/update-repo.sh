#!/bin/bash
# Update the APT repository with new .deb packages
# Uses reprepro for proper repo management
set -e

REPO_BASE="${REPO_BASE:-/var/lib/nitpick-apt}"
CONF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../conf" && pwd)"
DIST="${DIST:-noble}"

if ! command -v reprepro &>/dev/null; then
    echo "Error: reprepro not installed. Install with: sudo apt install reprepro"
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "Usage: update-repo.sh <deb-file> [deb-file...]"
    echo "  Adds .deb packages to the APT repository"
    exit 1
fi

for deb in "$@"; do
    if [ ! -f "$deb" ]; then
        echo "Error: $deb not found"
        exit 1
    fi
    echo "Adding $(basename "$deb") to $DIST..."
    reprepro -b "$REPO_BASE" --confdir "$CONF_DIR" includedeb "$DIST" "$deb"
done

echo "Repository updated."
