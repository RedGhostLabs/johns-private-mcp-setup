#!/bin/bash
# Red Ghost Custom Server Installer

set -e

echo "=============================="
echo " Red Ghost Custom MCP Installer"
echo "=============================="

if ! command -v npm >/dev/null 2>&1; then
  echo "❌ npm not found. Install Node.js from https://nodejs.org/"
  exit 1
fi

echo "✓ npm: $(npm --version)"
echo "✓ node: $(node --version)"

# Install the custom server globally from the repo path
# This expects you're running the script from the repo root on your machine.
npm install -g ./servers/redghost-custom

echo ""
echo "✓ Installed mcp-server-redghost-custom"
echo "Run 'mcp-server-redghost-custom --help' to verify (it should print usage)."
