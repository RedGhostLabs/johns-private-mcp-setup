# MCP Setup Verification Checklist

Use this checklist to verify your MCP setup is correct.

## Prerequisites Check

- [ ] **Node.js installed**
  ```bash
  node --version
  # Should show v16.0.0 or higher
  ```

- [ ] **npm installed**
  ```bash
  npm --version
  # Should show 8.0.0 or higher
  ```

- [ ] **AI application installed**
  - Claude Desktop, OR
  - Ollama, OR
  - Other MCP-compatible AI

---

## Server Installation Check

- [ ] **Filesystem server installed**
  ```bash
  npm list -g @modelcontextprotocol/server-filesystem
  which mcp-server-filesystem
  ```

- [ ] **Fetch server installed** (optional but recommended)
  ```bash
  npm list -g @modelcontextprotocol/server-fetch
  ```

- [ ] **Other servers installed** (as needed)
  ```bash
  npm list -g | grep modelcontextprotocol
  ```

- [ ] **Server commands are in PATH**
  ```bash
  which mcp-server-filesystem
  # Should return a path, not "not found"
  ```

---

## Configuration Check

- [ ] **Config file exists**
  ```bash
  # macOS
  ls -la ~/Library/Application\ Support/Claude/claude_desktop_config.json

  # Windows
  dir %APPDATA%\Claude\claude_desktop_config.json

  # Linux
  ls -la ~/.config/Claude/claude_desktop_config.json
  ```

- [ ] **Config is valid JSON**
  ```bash
  cat your-config.json | python -m json.tool
  # Should not show syntax errors
  ```

- [ ] **Config structure is correct**
  ```json
  {
    "mcpServers": {
      "filesystem": {
        "command": "mcp-server-filesystem",
        "args": ["/path/to/directory"]
      }
    }
  }
  ```

- [ ] **Paths in config exist**
  ```bash
  ls -la /path/from/config
  # Should list the directory contents
  ```

- [ ] **Paths are absolute, not relative**
  - ✅ `/Users/username/Documents`
  - ✅ `C:\\Users\\username\\Documents`
  - ❌ `~/Documents` (may not work in all setups)
  - ❌ `./documents` (relative paths)

- [ ] **Windows paths use double backslashes**
  ```json
  "args": ["C:\\Users\\Username\\Documents"]
  ```
  OR forward slashes:
  ```json
  "args": ["C:/Users/Username/Documents"]
  ```

---

## Directory Permissions Check

- [ ] **Test directory exists**
  ```bash
  ls -la ~/mcp-test
  ```

- [ ] **Directory is readable**
  ```bash
  ls ~/mcp-test
  # Should list contents without errors
  ```

- [ ] **Directory is writable**
  ```bash
  touch ~/mcp-test/test-write.txt
  rm ~/mcp-test/test-write.txt
  # Should create and delete file successfully
  ```

- [ ] **Permissions are correct**
  ```bash
  ls -la ~ | grep mcp-test
  # Should show your user as owner
  # Should be readable and writable (755 or 775)
  ```

---

## AI Application Check

- [ ] **AI application is fully quit** (not just window closed)
  ```bash
  # macOS
  ps aux | grep Claude
  # Should show nothing running

  # Windows
  tasklist | findstr Claude
  # Should show nothing running
  ```

- [ ] **AI application restarted after config changes**
  - Fully quit application
  - Wait 5 seconds
  - Restart application
  - Wait for full startup

- [ ] **No error messages on startup**
  - Check for popup warnings
  - Check application logs if available

---

## Test Prompts

- [ ] **AI recognizes MCP servers**
  ```
  Prompt: "What MCP servers do you have access to?"
  Expected: Lists filesystem, fetch, and any others you configured
  ```

- [ ] **Filesystem read test**
  ```
  Prompt: "List the files in [your-test-directory]"
  Expected: Shows actual file list
  ```

- [ ] **Filesystem write test**
  ```
  Prompt: "Create a file called test.txt in [your-test-directory] with content 'Hello MCP'"
  Expected: File created successfully
  ```

- [ ] **Verify file was created**
  ```bash
  cat ~/mcp-test/test.txt
  # Should show "Hello MCP"
  ```

- [ ] **Fetch server test** (if installed)
  ```
  Prompt: "Fetch https://api.github.com/zen"
  Expected: Returns a Zen quote from GitHub
  ```

---

## Troubleshooting Steps Taken

Document what you've tried:

- [ ] Verified all prerequisites
- [ ] Checked config syntax with JSON validator
- [ ] Restarted AI application (fully quit and relaunch)
- [ ] Tested with simple, known-good paths
- [ ] Checked server installation with npm list
- [ ] Verified permissions on test directories
- [ ] Read `common-issues.md` for solutions
- [ ] Tried with a fresh test directory (`~/mcp-test`)

---

## Platform-Specific Checks

### macOS
- [ ] Config location: `~/Library/Application Support/Claude/claude_desktop_config.json`
- [ ] Using macOS paths: `/Users/username/...`
- [ ] No permission issues with Library folder
- [ ] Cmd+Q used to quit (not just close window)

### Windows
- [ ] Config location: `%APPDATA%\Claude\claude_desktop_config.json`
- [ ] Using Windows paths with double backslashes: `C:\\Users\\...`
- [ ] Running as user with proper permissions
- [ ] Fully quit from system tray

### Linux
- [ ] Config location: `~/.config/Claude/claude_desktop_config.json`
- [ ] Using Linux paths: `/home/username/...`
- [ ] Proper file permissions (644 for config, 755 for directories)
- [ ] Process fully killed (not just window closed)

---

## Success Criteria

You can check all these boxes:

- [ ] AI lists your configured MCP servers when asked
- [ ] AI can read files from the configured directory
- [ ] AI can create files in the configured directory
- [ ] No error messages during any operation
- [ ] Operations complete within 1-2 seconds
- [ ] File operations confirmed via terminal/file explorer

---

## If Everything Checks Out But Still Not Working

1. **Create a minimal test case:**
   ```json
   {
     "mcpServers": {
       "filesystem": {
         "command": "mcp-server-filesystem",
         "args": ["/tmp"]
       }
     }
   }
   ```
   Test with `/tmp` (macOS/Linux) or `C:\\temp` (Windows)

2. **Check AI client version:**
   - Ensure you're using the latest version
   - Some features may require specific versions

3. **Review logs:**
   - macOS: Console app, filter for Claude
   - Windows: Event Viewer
   - Linux: Check `.config/Claude/logs/` if exists

4. **Try a different server:**
   - If filesystem doesn't work, try fetch
   - Helps isolate if issue is specific to one server

5. **Ask for help:**
   - Open issue on this repo
   - Include completed checklist
   - Share config (remove sensitive info)
   - Describe exact error messages

---

## Quick Diagnostic Script

Save this as `mcp-diagnostic.sh` and run it:

```bash
#!/bin/bash

echo "=== MCP Setup Diagnostic ==="
echo ""

echo "1. Node/npm versions:"
node --version
npm --version
echo ""

echo "2. Installed MCP servers:"
npm list -g --depth=0 | grep modelcontextprotocol
echo ""

echo "3. Server command locations:"
which mcp-server-filesystem
which mcp-server-fetch
echo ""

echo "4. Config file check:"
if [ -f ~/Library/Application\ Support/Claude/claude_desktop_config.json ]; then
    echo "Config exists (macOS)"
    cat ~/Library/Application\ Support/Claude/claude_desktop_config.json | python -m json.tool > /dev/null && echo "Config is valid JSON" || echo "Config has JSON errors"
elif [ -f ~/.config/Claude/claude_desktop_config.json ]; then
    echo "Config exists (Linux)"
    cat ~/.config/Claude/claude_desktop_config.json | python -m json.tool > /dev/null && echo "Config is valid JSON" || echo "Config has JSON errors"
else
    echo "Config file not found"
fi
echo ""

echo "5. Test directory:"
if [ -d ~/mcp-test ]; then
    echo "Test directory exists"
    ls -la ~/mcp-test | head -5
    touch ~/mcp-test/write-test 2>/dev/null && rm ~/mcp-test/write-test && echo "Directory is writable" || echo "Directory is not writable"
else
    echo "Test directory does not exist (create with: mkdir ~/mcp-test)"
fi
echo ""

echo "6. Running AI processes:"
ps aux | grep -i claude | grep -v grep || echo "No Claude processes found"
echo ""

echo "=== End Diagnostic ==="
```

Run with: `bash mcp-diagnostic.sh`
