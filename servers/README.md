# MCP Servers Overview

This folder contains installation scripts for MCP servers.

## Quick Install

### Essential Servers (Recommended for everyone)
```bash
chmod +x servers/install-essentials.sh
./servers/install-essentials.sh
```

Installs:
- **filesystem** - File and directory operations
- **fetch** - HTTP requests and API calls
- **github** - GitHub integration
- **sqlite** - Database operations

### Advanced Servers (For power users)
```bash
chmod +x servers/install-advanced.sh
./servers/install-advanced.sh
```

Installs:
- **puppeteer** - Browser automation
- **memory** - Persistent memory
- **sequential-thinking** - Enhanced reasoning

---

## Server Details

### Filesystem Server
**Package:** `@modelcontextprotocol/server-filesystem`

**What it does:**
- Read and write files
- List directories
- Search for files
- Navigate folder structures

**Use cases:**
- Document management
- Code analysis
- Log file analysis
- Automated file organization

**Configuration:**
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

**Safety:** Only give access to directories you trust the AI to modify.

---

### Fetch Server
**Package:** `@modelcontextprotocol/server-fetch`

**What it does:**
- Make HTTP GET/POST requests
- Call REST APIs
- Fetch web content
- Check URLs

**Use cases:**
- API integration
- Web scraping (simple)
- Status monitoring
- Data fetching

**Configuration:**
```json
{
  "mcpServers": {
    "fetch": {
      "command": "mcp-server-fetch"
    }
  }
}
```

**Safety:** Be respectful of rate limits and robots.txt.

---

### GitHub Server
**Package:** `@modelcontextprotocol/server-github`

**What it does:**
- Browse repositories
- Read issues and PRs
- Search code
- Get repo information

**Use cases:**
- Code research
- Issue tracking
- Repository analysis
- Documentation lookup

**Configuration:**
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

**Note:** Token is optional but recommended for higher rate limits.

---

### SQLite Server
**Package:** `@modelcontextprotocol/server-sqlite`

**What it does:**
- Query SQLite databases
- Create tables
- Insert/update/delete data
- Export results

**Use cases:**
- Data analysis
- Local database management
- Testing
- Data migration

**Configuration:**
```json
{
  "mcpServers": {
    "sqlite": {
      "command": "mcp-server-sqlite",
      "args": ["/path/to/databases"]
    }
  }
}
```

**Safety:** Back up databases before giving write access.

---

### Puppeteer Server (Advanced)
**Package:** `@modelcontextprotocol/server-puppeteer`

**What it does:**
- Control a headless browser
- Take screenshots
- Fill forms
- Extract page data

**Use cases:**
- Web scraping
- Testing
- Automated workflows
- PDF generation

**Configuration:**
```json
{
  "mcpServers": {
    "puppeteer": {
      "command": "mcp-server-puppeteer"
    }
  }
}
```

**Requirements:** Chrome or Chromium browser installed.
**Note:** Some websites block automation.

---

### Memory Server (Advanced)
**Package:** `@modelcontextprotocol/server-memory`

**What it does:**
- Store information between conversations
- Create persistent knowledge base
- Remember context

**Use cases:**
- Project context
- Personal preferences
- Long-term projects
- Knowledge management

**Configuration:**
```json
{
  "mcpServers": {
    "memory": {
      "command": "mcp-server-memory"
    }
  }
}
```

**Note:** Data is stored locally on your machine.

---

### Sequential Thinking Server (Advanced)
**Package:** `@modelcontextprotocol/server-sequential-thinking`

**What it does:**
- Enhances AI reasoning
- Better handles complex tasks
- Improves step-by-step thinking

**Use cases:**
- Complex problem solving
- Multi-step workflows
- Debugging
- Planning

**Configuration:**
```json
{
  "mcpServers": {
    "sequential-thinking": {
      "command": "mcp-server-sequential-thinking"
    }
  }
}
```

**Note:** Works automatically once configured.

---

## Installation Tips

### Prerequisites
- Node.js v16+ and npm
- Sufficient disk space (~50-100MB per server)
- Internet connection for installation

### macOS/Linux
```bash
# Fix npm permissions first (if needed)
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Then install servers
./servers/install-essentials.sh
```

### Windows
```powershell
# Run PowerShell as Administrator
# Then run the install commands

# Or use WSL (Windows Subsystem for Linux)
wsl
./servers/install-essentials.sh
```

### Troubleshooting Installation

**EACCES errors:**
```bash
# Option 1: Fix permissions (preferred)
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

# Option 2: Use sudo (not recommended)
sudo npm install -g [package]
```

**Server not found after install:**
```bash
# Check where npm installed it
npm list -g --depth=0

# Find the binary
which mcp-server-filesystem

# Add npm bin to PATH
export PATH="$(npm config get prefix)/bin:$PATH"
```

---

## Choosing Servers

### Start Here (Everyone)
1. **filesystem** - Essential for file operations
2. **fetch** - Essential for API calls

### Add Next (Most Users)
3. **github** - If you work with GitHub
4. **sqlite** - If you work with data/databases

### Advanced (Power Users)
5. **puppeteer** - For web automation
6. **memory** - For long-term projects
7. **sequential-thinking** - For complex tasks

### Don't Install Everything
- More servers = more complexity
- Start simple, add as needed
- Can always install more later

---

## Server Comparison

| Server | Difficulty | Setup Time | Use Case |
|--------|-----------|------------|----------|
| filesystem | Easy | 1 min | File operations |
| fetch | Easy | 1 min | API calls |
| github | Easy | 2 min | GitHub integration |
| sqlite | Medium | 2 min | Database work |
| puppeteer | Hard | 5 min | Web automation |
| memory | Medium | 2 min | Persistent storage |
| sequential-thinking | Easy | 1 min | Enhanced reasoning |

---

## Updating Servers

```bash
# Update a specific server
npm update -g @modelcontextprotocol/server-filesystem

# Update all MCP servers
npm update -g $(npm list -g --depth=0 | grep @modelcontextprotocol | awk '{print $2}' | cut -d@ -f1)
```

---

## Uninstalling Servers

```bash
# Uninstall a specific server
npm uninstall -g @modelcontextprotocol/server-filesystem

# List all installed servers
npm list -g --depth=0 | grep modelcontextprotocol
```

---

## Next Steps

1. **Install servers** using the scripts above
2. **Configure AI** using files in `../config/`
3. **Test setup** using prompts in `../sandbox/`
4. **Learn patterns** from `../examples/`

See `server-guide.md` for detailed server documentation.
