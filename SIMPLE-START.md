# Simple MCP Setup - For Complete Beginners

## What This Does
Gives your AI (like GitHub Copilot chat) access to your files and the internet.

## Install (5 minutes)

### Step 1: Install Node.js
1. Go to https://nodejs.org/
2. Click the big green button that says "Download"
3. Run the installer
4. Click "Next" until it's done

### Step 2: Install MCP Servers
Open PowerShell and paste this:

```powershell
npm install -g @modelcontextprotocol/server-filesystem
npm install -g @modelcontextprotocol/server-fetch
```

Wait for it to finish. That's it.

## If Using GitHub Copilot Chat
MCP works best with Claude Desktop or similar apps. GitHub Copilot doesn't support MCP servers yet.

**What you CAN do with Copilot:**
- Ask it to read/write files (it does this without MCP)
- Ask it coding questions
- Generate code

**What MCP adds (when used with Claude Desktop):**
- Direct file system access
- Web scraping
- Database queries
- And way more

## Want the Full Experience?
1. Download Claude Desktop from https://claude.ai/download
2. Free to use
3. Supports all MCP servers

Then come back and we'll set it up properly.

## Questions?
Just ask. Don't overcomplicate this.
