#!/bin/bash
# Build the nitpick compiler .deb package
# Expects the nitpick repo to be checked out and CMake-ready
set -e

ARIA_DIR="${1:?Usage: build-compiler-deb.sh <nitpick-repo-dir>}"
VERSION="${2:-0.2.15}"
RELEASE="${3:-1}"

echo "Building nitpick ${VERSION}-${RELEASE} .deb..."

cd "$ARIA_DIR"
if [ -f debian/build-deb.sh ]; then
    bash debian/build-deb.sh
else
    echo "Error: debian/build-deb.sh not found in $ARIA_DIR"
    exit 1
fi

echo "Done. .deb should be in $ARIA_DIR/"
