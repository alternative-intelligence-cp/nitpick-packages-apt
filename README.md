# nitpick-packages-apt

<p align="center">
    <img src="assets/nitpick_logo.png" alt="Nitpick logo: raccoon holding a magnifying glass" width="220">
</p>

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

> 🚧 **Rebrand in progress:** Nitpick is becoming **Nitpick**. This APT repository
> infrastructure still uses Nitpick package names while the migration is underway.
> Repository URLs, keyrings, and package names need compatibility planning before
> any breaking rename.

APT repository infrastructure for the [Nitpick programming language](https://github.com/alternative-intelligence-cp/nitpick).

## Overview

This repo manages the Debian/Ubuntu APT package repository hosted at `packages.npker.ai-liberation-platform.org`.

## Packages

| Package | Source Repo | Contents |
|---------|-----------|----------|
| `nitpick` | [nitpick](https://github.com/alternative-intelligence-cp/nitpick) | Compiler, LSP, stdlib, nitpick-pkg, nitpick-doc |
| `nitpick-tools` | [nitpick-tools](https://github.com/alternative-intelligence-cp/nitpick-tools) | nitpick-safety, nitpick-mcp |
| `nitpick-man-pages` | [nitpick-docs](https://github.com/alternative-intelligence-cp/nitpick-docs) | Man pages |
| `nitpick-packages` | [nitpick-packages](https://github.com/alternative-intelligence-cp/nitpick-packages) | Ecosystem packages |
| `nitpick-archive-keyring` | This repo | GPG key for APT verification |

## User Setup

```bash
curl -fsSL https://packages.npker.ai-liberation-platform.org/setup-repo.sh | sudo bash
sudo apt install nitpick
```

Or manually:
```bash
curl -fsSL https://packages.npker.ai-liberation-platform.org/nitpick-archive-keyring.gpg | \
    sudo gpg --dearmor -o /usr/share/keyrings/nitpick-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/nitpick-archive-keyring.gpg] https://packages.npker.ai-liberation-platform.org noble main" | \
    sudo tee /etc/apt/sources.list.d/nitpick.list
sudo apt update && sudo apt install nitpick
```

## Maintainer Workflow

```bash
# Build a .deb
scripts/build-compiler-deb.sh /path/to/nitpick

# Add to repo
scripts/update-repo.sh nitpick_0.2.2-1_amd64.deb

# Publish to web server
scripts/publish.sh
```

## Structure

```
conf/           - reprepro configuration
keys/           - GPG keyring and signing scripts
scripts/        - Build, update, and publish scripts
```

## License

AGPL-3.0 — see [LICENSE.md](LICENSE.md)
