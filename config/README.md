# MCP Configuration Guide

This folder contains example MCP server configurations for different AI clients.

## Quick Start

1. Choose your AI client below
2. Copy the appropriate config file
3. Customize the paths for your system
4. Restart your AI application
5. Test with a simple prompt

---

## Claude Desktop

**Config location:**
- macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
- Windows: `%APPDATA%\Claude\claude_desktop_config.json`
- Linux: `~/.config/Claude/claude_desktop_config.json`

**Setup:**
```bash
# Copy the example config
cp config/claude-desktop-config.json ~/Library/Application\ Support/Claude/claude_desktop_config.json

# Edit the file to customize paths
# Then restart Claude Desktop
```

See `claude-desktop-config.json` for the full example.

---

## Ollama / Open WebUI

**Config location:**
Varies by setup. Typically configured through the web UI or via environment variables.

See `ollama-config.json` for the format.

---

## Other AI Clients

Most AI clients that support MCP use a similar JSON structure:

```json
{
  "mcpServers": {
    "server-name": {
      "command": "command-to-run-server",
      "args": ["arg1", "arg2"],
      "env": {
        "ENV_VAR": "value"
      }
    }
  }
}
```

---

## Customizing Paths

**Important:** Replace placeholder paths with actual paths on your system.

### macOS/Linux Examples:
- Home directory: `~/` or `/Users/username/`
- Documents: `~/Documents`
- Custom folder: `~/mcp-workspace`

### Windows Examples:
- User folder: `C:\\Users\\YourUsername\\`
- Documents: `C:\\Users\\YourUsername\\Documents`
- Custom folder: `C:\\mcp-workspace`

**Note:** Windows paths need double backslashes (`\\`) in JSON.

---

## Server Command Names

After installing servers with npm, the commands are usually:
- `mcp-server-filesystem`
- `mcp-server-fetch`
- `mcp-server-github`
- `mcp-server-sqlite`

Check your npm global bin directory if commands aren't found:
```bash
npm list -g --depth=0
which mcp-server-filesystem
```

---

## Environment Variables

Some servers need environment variables (like GitHub tokens):

```json
{
  "mcpServers": {
    "github": {
      "command": "mcp-server-github",
      "env": {
        "GITHUB_TOKEN": "your-token-here"
      }
    }
  }
}
```

---

## Testing Your Config

After setup, test with these prompts:
- "List files in [the folder you gave access to]"
- "Fetch the content from https://api.github.com"
- "What MCP servers are available?"

---

## Troubleshooting

If servers don't show up:
1. Check JSON syntax (no trailing commas, matching brackets)
2. Verify paths exist and have correct permissions
3. Ensure servers are installed (`npm list -g`)
4. Restart your AI application completely
5. Check logs (location varies by AI client)

See `../troubleshooting/common-issues.md` for more help.
