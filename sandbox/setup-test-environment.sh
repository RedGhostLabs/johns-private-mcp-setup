#!/bin/bash

# MCP Test Environment Setup Script
# Creates a safe testing environment for MCP servers

echo "Setting up MCP test environment..."

# Create test directory
TEST_DIR="$HOME/mcp-test"

if [ -d "$TEST_DIR" ]; then
    echo "Test directory already exists at $TEST_DIR"
    read -p "Delete and recreate? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$TEST_DIR"
        echo "Removed existing test directory"
    else
        echo "Keeping existing directory"
        exit 0
    fi
fi

# Create directory structure
mkdir -p "$TEST_DIR"
mkdir -p "$TEST_DIR/subdir"
mkdir -p "$TEST_DIR/documents"

echo "Created directory structure at $TEST_DIR"

# Create sample files
cat > "$TEST_DIR/test-file.txt" << 'EOF'
This is a test file for MCP filesystem server.
You can safely read, modify, or delete this file.

Test number: 12345
EOF

cat > "$TEST_DIR/another-file.md" << 'EOF'
# Sample Markdown File

This is a test markdown file.

## Features to Test
- Read files
- Write files
- Search files
- List directories

## Status
Ready for testing!
EOF

cat > "$TEST_DIR/data.json" << 'EOF'
{
  "name": "MCP Test Data",
  "version": "1.0",
  "tests": [
    "filesystem",
    "fetch",
    "github"
  ],
  "status": "active"
}
EOF

cat > "$TEST_DIR/subdir/nested-file.txt" << 'EOF'
This file is in a subdirectory.
Use it to test directory navigation.
EOF

cat > "$TEST_DIR/documents/notes.md" << 'EOF'
# My Notes

This is a sample notes file for testing document organization.

## Todo
- [ ] Test filesystem server
- [ ] Test fetch server
- [ ] Test github server
EOF

# Create empty directory for testing
mkdir -p "$TEST_DIR/empty-folder"

# Set permissions
chmod -R 755 "$TEST_DIR"

echo ""
echo "✅ Test environment created successfully!"
echo ""
echo "Test directory: $TEST_DIR"
echo ""
echo "Files created:"
echo "  - test-file.txt"
echo "  - another-file.md"
echo "  - data.json"
echo "  - subdir/nested-file.txt"
echo "  - documents/notes.md"
echo "  - empty-folder/ (empty)"
echo ""
echo "Next steps:"
echo "1. Update your MCP config to use: $TEST_DIR"
echo "2. Restart your AI application"
echo "3. Try prompts from sandbox/sample-prompts.md"
echo ""
echo "To reset: rm -rf $TEST_DIR && ./sandbox/setup-test-environment.sh"
