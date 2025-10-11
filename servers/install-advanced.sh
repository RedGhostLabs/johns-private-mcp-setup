#!/bin/bash

# MCP Advanced Servers Installer
# Installs additional MCP servers for power users

set -e  # Exit on error

echo "==============================="
echo "MCP Advanced Servers Installer"
echo "==============================="
echo ""
echo "⚠️  These servers are more complex and may require additional setup."
echo ""

# Check prerequisites
if ! command -v npm >/dev/null 2>&1; then
    echo "❌ ERROR: npm is not installed."
    echo "Please install Node.js first."
    exit 1
fi

echo "✓ npm found: $(npm --version)"
echo ""

# Function to install a server with optional dependencies check
install_server() {
    local package=$1
    local name=$2
    local prereq=$3

    echo "---"
    echo "Installing $name..."

    if [ -n "$prereq" ]; then
        echo "Note: $prereq"
    fi

    if npm install -g "$package"; then
        echo "✓ $name installed successfully"
    else
        echo "❌ Failed to install $name"
        echo "   This server may have additional requirements."
        return 1
    fi
}

# Ask for confirmation
echo "This will install:"
echo "  • Puppeteer Server (browser automation)"
echo "  • Memory Server (persistent memory)"
echo "  • Sequential Thinking Server (enhanced reasoning)"
echo ""
read -p "Continue? (y/n) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation cancelled."
    exit 0
fi

echo ""
echo "Installing advanced MCP servers..."
echo ""

install_server "@modelcontextprotocol/server-puppeteer" "Puppeteer Server" "Requires Chrome/Chromium"
install_server "@modelcontextprotocol/server-memory" "Memory Server" ""
install_server "@modelcontextprotocol/server-sequential-thinking" "Sequential Thinking Server" ""

echo ""
echo "==============================="
echo "✓ Installation Complete!"
echo "==============================="
echo ""
echo "Installed servers:"
echo "  • puppeteer - Browser automation and web scraping"
echo "  • memory - Persistent memory across conversations"
echo "  • sequential-thinking - Enhanced reasoning for complex tasks"
echo ""
echo "⚠️  Configuration Notes:"
echo ""
echo "Puppeteer:"
echo "  - Requires Chrome or Chromium browser"
echo "  - May need additional system libraries on Linux"
echo "  - See examples/web-automation.md"
echo ""
echo "Memory:"
echo "  - Stores data locally"
echo "  - Configure storage path in your MCP config"
echo ""
echo "Sequential Thinking:"
echo "  - Automatically enhances AI reasoning"
echo "  - No additional configuration needed"
echo ""
echo "Update your MCP config file to use these servers."
echo "See config/README.md for examples."
echo ""
