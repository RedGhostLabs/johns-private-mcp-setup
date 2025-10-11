# Actually Read This: Your 10-Minute MCP Test

Real talk: You've been coding for a year and just got GitHub last week. I say this with love: this is the "just make it work" guide. Theory later, working software now.

## Goal (10 minutes)
Install one MCP server, configure your AI to use it, and test it.

If it works, you'll understand MCP better than reading 10 articles. If it doesn't, you'll know what to fix.

---

## Step 1 — Install One Server (2 minutes)

We're using the filesystem server as it's safe and obvious.

```bash
# Install the filesystem server (Node.js + npm required)
if ! command -v npm >/dev/null 2>&1; then
  echo "ERROR: npm is not installed. Install Node.js (https://nodejs.org/) and try again."
  exit 1
fi

npm install -g @modelcontextprotocol/server-filesystem || {
  echo "Installation failed. Try running with sudo on Linux/Mac or check npm permissions."
  exit 1
}

echo "filesystem server installed. Path:"
which mcp-server-filesystem || echo "(binary may be named differently; check npm global bin)"
```

What happened: you installed a tiny program that can read/write files on behalf of your AI.

---

## Step 2 — Configure Your AI (3 minutes)

Your AI needs a JSON config telling it what MCP servers exist.

### Claude Desktop
Common locations:
- macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
- Windows: `%APPDATA%\Claude\claude_desktop_config.json`
- Linux: `~/.config/Claude/claude_desktop_config.json`

Edit and add a servers block:

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "mcp-server-filesystem",
      "args": [
        "/Users/YOUR_USERNAME/Documents"
      ]
    }
  }
}
```

Important: replace the path with a folder you control. For example, on macOS/Linux use `~/mcp-test` or on Windows use a path like `C:\\Users\\YOUR_USERNAME\\mcp-test` (note the double backslashes).

### Ollama / Open WebUI
See `config/ollama-config.json` in this repo for the format.

---

## Step 3 — Restart Your AI (1 minute)

Fully quit and relaunch the app. Not just close the window—actually quit the process.

- macOS: Cmd+Q
- Windows: Right-click tray icon → Quit
- Linux: Close and ensure process is gone

Restarting loads the new MCP config.

---

## Step 4 — Test It (2 minutes)

Message your AI:

```
List the files in the Documents folder you gave it access to.
```

Expected: AI responds with actual filenames from that folder.

If it worked: celebrate. You just gave an AI direct access to tools.

If it failed: likely causes:
- Config syntax error (missing comma, wrong bracket)
- Wrong path or permission issue
- Server not installed or not in PATH
- AI didn't actually reload config

Check `troubleshooting/common-issues.md`.

---

## What MCP Actually Does (short)

MCP = protocol between AIs and small local servers (tools). Servers expose capabilities via a simple interface. AI asks servers to do things, gets back structured results. It's like USB for AI.

Servers = filesystem, fetch, github, puppeteer, docker, memory, commands, etc.

---

## When to use n8n vs MCP

Use MCP when:
- You want interactive AI to use tools in a conversation
- You value local privacy and minimal setup
- You want results in minutes

Use n8n when:
- You need scheduled automations or webhooks
- You want complex multi-service workflows running without manual triggers

Short: Start with MCP. Add n8n only when you need automation at scale.

---

## Friendly roast
No matter your experience level, you're in the right place — now that you're here, run the installer and stop theorizing.

---

## Next steps

If the test worked:
- Play in `sandbox/`
- Install more servers with `servers/install-essentials.sh`
- Try examples in `examples/`

If it didn't:
- Read `troubleshooting/common-issues.md`
- Follow the checklist in `troubleshooting/setup-checklist.md`
- Open an issue on this repo if you need help

Now go do it. Stop reading and start running commands. You’ll learn faster that way.
