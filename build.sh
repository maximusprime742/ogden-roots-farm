#!/usr/bin/env bash
set -euo pipefail

HUGO_VERSION="0.146.0"

echo "Installing Hugo Extended ${HUGO_VERSION}..."
curl -LJO "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
tar -xf "hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
export PATH="$(pwd):$PATH"

echo "Updating theme submodule..."
git submodule update --init --recursive

echo "Building site..."
hugo --minify
