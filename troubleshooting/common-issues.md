# Common Issues and Solutions

Quick fixes for the most common MCP setup problems.

## Issue: AI doesn't see any MCP servers

### Symptoms
- AI says "I don't have access to that"
- No tools available in AI interface
- Prompts about filesystem/fetch don't work

### Solutions

**1. Check config file exists**
```bash
# macOS
ls -la ~/Library/Application\ Support/Claude/claude_desktop_config.json

# Windows
dir %APPDATA%\Claude\claude_desktop_config.json

# Linux
ls -la ~/.config/Claude/claude_desktop_config.json
```

**2. Verify config syntax**
- Must be valid JSON
- No trailing commas
- Matching brackets
- Use double quotes, not single quotes

**3. Restart AI completely**
- Don't just close window
- Quit application fully
- macOS: Cmd+Q
- Windows: Right-click tray → Quit
- Linux: Kill process

**4. Check server installation**
```bash
npm list -g @modelcontextprotocol/server-filesystem
which mcp-server-filesystem
```

---

## Issue: Servers installed but not found

### Symptoms
- Config looks correct
- Servers are installed
- AI still can't access them

### Solutions

**1. Verify command names**
```bash
# List all global npm packages
npm list -g --depth=0

# Find the actual command name
which mcp-server-filesystem
```

**2. Check PATH**
```bash
# Add npm global bin to PATH if needed
npm config get prefix
# Add [prefix]/bin to your PATH
```

**3. Use full paths in config**
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "/usr/local/bin/mcp-server-filesystem",
      "args": ["/Users/username/Documents"]
    }
  }
}
```

---

## Issue: Permission denied / Access denied

### Symptoms
- AI says it can't read/write files
- Permission errors in logs
- Operations fail silently

### Solutions

**1. Check directory permissions**
```bash
ls -la ~/target-directory
# Should be readable/writable by your user
```

**2. Fix permissions**
```bash
chmod 755 ~/target-directory
```

**3. Try with a test directory**
```bash
mkdir ~/mcp-test
chmod 755 ~/mcp-test
# Update config to use this directory
```

**4. Don't use system directories**
- ❌ /etc, /usr, /sys, /var
- ✅ ~/Documents, ~/mcp-test, ~/workspace

---

## Issue: Config file not loading

### Symptoms
- Made changes to config
- Changes don't take effect
- Old settings still active

### Solutions

**1. Save the file**
- Obvious but easy to forget
- Check file modification time

**2. Restart application properly**
```bash
# macOS - force quit if needed
killall Claude

# Linux
pkill -f claude

# Windows
taskkill /IM Claude.exe /F
```

**3. Check you're editing the right file**
```bash
# Find all config files
find ~ -name "claude_desktop_config.json" 2>/dev/null
```

---

## Issue: JSON syntax errors

### Symptoms
- Config doesn't load
- AI doesn't see servers
- No error message

### Common Mistakes

**Trailing comma:**
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "mcp-server-filesystem"
    }, ← Remove this comma
  }
}
```

**Missing quote:**
```json
{
  "mcpServers: { ← Missing closing quote
    ...
  }
}
```

**Single quotes:**
```json
{
  'mcpServers': { ← Use double quotes
    ...
  }
}
```

### Solution
Use a JSON validator:
```bash
# Command line
cat config.json | python -m json.tool

# Or online
# https://jsonlint.com
```

---

## Issue: Windows path problems

### Symptoms
- Paths with spaces don't work
- Backslashes cause errors
- Config fails on Windows

### Solutions

**1. Double backslashes**
```json
{
  "mcpServers": {
    "filesystem": {
      "args": ["C:\\Users\\YourName\\Documents"]
    }
  }
}
```

**2. Use forward slashes**
```json
{
  "mcpServers": {
    "filesystem": {
      "args": ["C:/Users/YourName/Documents"]
    }
  }
}
```

**3. No spaces in paths (or escape them)**
```json
"args": ["C:\\Users\\Your Name\\Documents"] ← Works
"args": ["C:/Users/YourName/mcp-test"] ← Better
```

---

## Issue: npm install fails

### Symptoms
- Permission errors during install
- EACCES errors
- Can't write to directory

### Solutions

**macOS/Linux:**
```bash
# Option 1: Fix npm permissions (recommended)
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Then try install again
npm install -g @modelcontextprotocol/server-filesystem
```

**Option 2: Use sudo (not recommended)**
```bash
sudo npm install -g @modelcontextprotocol/server-filesystem
```

**Windows:**
- Run PowerShell/CMD as Administrator
- Then run npm install command

---

## Issue: Server crashes or errors

### Symptoms
- Server starts then stops
- Operations fail mid-execution
- Inconsistent behavior

### Solutions

**1. Check Node.js version**
```bash
node --version
# Should be v16+ for most servers
```

**2. Reinstall server**
```bash
npm uninstall -g @modelcontextprotocol/server-filesystem
npm install -g @modelcontextprotocol/server-filesystem
```

**3. Check logs**
- Location varies by AI client
- Claude Desktop: Check Console app (macOS) or Event Viewer (Windows)

**4. Test server directly**
```bash
# Try running the server manually
mcp-server-filesystem ~/test-dir
# Should not crash immediately
```

---

## Issue: GitHub server auth fails

### Symptoms
- Can't access private repos
- Rate limited quickly
- GitHub operations fail

### Solutions

**1. Create personal access token**
- Go to GitHub Settings → Developer settings → Personal access tokens
- Generate new token (classic)
- Select scopes: repo, read:org
- Copy token immediately

**2. Add to config**
```json
{
  "mcpServers": {
    "github": {
      "command": "mcp-server-github",
      "env": {
        "GITHUB_TOKEN": "your_token_here"
      }
    }
  }
}
```

**3. Don't commit tokens**
- Keep config file private
- Don't share screenshots with tokens
- Rotate tokens regularly

---

## Issue: Fetch server can't access URLs

### Symptoms
- Timeout errors
- Connection refused
- SSL errors

### Solutions

**1. Check network connectivity**
```bash
curl https://api.github.com
# Should work if fetch should work
```

**2. Check firewall**
- AI might be blocked by firewall
- Allow network access for AI application

**3. Try different URLs**
- Some sites block automated access
- Try https://httpbin.org/get for testing

**4. Check proxy settings**
- If behind corporate proxy
- May need proxy configuration in environment

---

## Issue: Servers work but AI says no access

### Symptoms
- Servers are running
- Config is correct
- AI still claims no access

### Solutions

**1. Check server scope**
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "mcp-server-filesystem",
      "args": ["/Users/you/Documents"] ← Must match your request
    }
  }
}
```

**2. Be specific in prompts**
```
❌ "Read my file" (AI doesn't know which file)
✅ "Read the file ~/Documents/notes.txt"
```

**3. Check AI understands what's available**
```
Prompt: "What MCP servers do you have access to?"
```

---

## Still Having Issues?

1. **Check setup checklist:** `setup-checklist.md`
2. **Review examples:** `../examples/`
3. **Test in sandbox:** `../sandbox/`
4. **Open an issue:** Include:
   - OS and version
   - AI client and version
   - Config file (remove tokens)
   - Error messages
   - What you've tried

---

## Quick Diagnostic Commands

```bash
# Check everything at once
echo "Node version:"
node --version

echo "\nNPM global packages:"
npm list -g --depth=0 | grep modelcontextprotocol

echo "\nConfig file:"
cat ~/Library/Application\ Support/Claude/claude_desktop_config.json 2>/dev/null || echo "Not found"

echo "\nTest directory:"
ls -la ~/mcp-test 2>/dev/null || echo "Not found"
```

Save this as `check-mcp.sh` and run when troubleshooting.
