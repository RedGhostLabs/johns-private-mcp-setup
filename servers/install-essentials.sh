#!/bin/bash

# MCP Essentials Installer
# Installs the core MCP servers needed for most use cases

set -e  # Exit on error

echo "================================"
echo "MCP Essential Servers Installer"
echo "================================"
echo ""

# Check prerequisites
if ! command -v npm >/dev/null 2>&1; then
    echo "❌ ERROR: npm is not installed."
    echo ""
    echo "Please install Node.js (which includes npm):"
    echo "  macOS: brew install node"
    echo "  Windows: Download from https://nodejs.org/"
    echo "  Linux: apt-get install nodejs npm (or use your package manager)"
    exit 1
fi

echo "✓ npm found: $(npm --version)"
echo "✓ node found: $(node --version)"
echo ""

# Function to install a server
install_server() {
    local package=$1
    local name=$2
    echo "Installing $name..."
    if npm install -g "$package"; then
        echo "✓ $name installed successfully"
    else
        echo "❌ Failed to install $name"
        echo "   Try running with sudo (Linux/Mac) or as Administrator (Windows)"
        return 1
    fi
}

# Install essential servers
echo "Installing essential MCP servers..."
echo ""

install_server "@modelcontextprotocol/server-filesystem" "Filesystem Server"
install_server "@modelcontextprotocol/server-fetch" "Fetch Server"
install_server "@modelcontextprotocol/server-github" "GitHub Server"
install_server "@modelcontextprotocol/server-sqlite" "SQLite Server"

echo ""
echo "================================"
echo "✓ Installation Complete!"
echo "================================"
echo ""
echo "Installed servers:"
echo "  • filesystem - Read/write files and directories"
echo "  • fetch - Make HTTP requests and call APIs"
echo "  • github - Interact with GitHub repositories"
echo "  • sqlite - Work with SQLite databases"
echo ""
echo "Next steps:"
echo "  1. Copy a config file from config/ folder"
echo "  2. Customize the paths for your system"
echo "  3. Restart your AI application"
echo "  4. Test with prompts from sandbox/"
echo ""
echo "Configuration help: see config/README.md"
echo "Testing help: see sandbox/README.md"
echo ""
