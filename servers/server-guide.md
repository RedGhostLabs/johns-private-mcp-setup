# Detailed MCP Server Guide

Comprehensive documentation for each MCP server.

## Table of Contents
- [Filesystem Server](#filesystem-server)
- [Fetch Server](#fetch-server)
- [GitHub Server](#github-server)
- [SQLite Server](#sqlite-server)
- [Puppeteer Server](#puppeteer-server)
- [Memory Server](#memory-server)
- [Sequential Thinking Server](#sequential-thinking-server)

---

## Filesystem Server

### Installation
```bash
npm install -g @modelcontextprotocol/server-filesystem
```

### Configuration
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "mcp-server-filesystem",
      "args": [
        "/path/to/allowed/directory",
        "/another/allowed/directory"
      ]
    }
  }
}
```

### Capabilities
- **Read files** - View file contents
- **Write files** - Create or modify files
- **List directories** - See folder contents
- **Search** - Find files by name or content
- **File metadata** - Size, modification date, permissions

### Safety Configuration
Only directories specified in `args` are accessible. The server cannot access parent directories or other locations.

### Best Practices
- Start with read-only testing
- Use specific directories, not `/` or `~`
- Test with `~/mcp-test` first
- Back up important data
- Use version control (git) for code

### Common Issues
- **Permission denied**: Check directory permissions (`chmod 755`)
- **Path not found**: Use absolute paths, not relative
- **Can't write**: Verify directory is writable by your user

### Example Prompts
```
"List all files in my Documents folder"
"Read the file ~/Documents/notes.txt"
"Create a file called todo.md with a task list template"
"Find all .py files in my project directory"
```

---

## Fetch Server

### Installation
```bash
npm install -g @modelcontextprotocol/server-fetch
```

### Configuration
```json
{
  "mcpServers": {
    "fetch": {
      "command": "mcp-server-fetch"
    }
  }
}
```

### Capabilities
- **HTTP GET** - Fetch data from URLs
- **HTTP POST** - Send data to APIs
- **Headers** - Custom request headers
- **JSON/Text** - Handle various response types

### Limitations
- No authentication middleware (use API tokens directly if supported)
- May be blocked by some sites
- Subject to CORS on some endpoints
- Respects standard HTTP timeouts

### Best Practices
- Respect rate limits
- Check robots.txt before scraping
- Use official APIs when available
- Handle errors gracefully
- Cache responses when appropriate

### Common Issues
- **Timeout**: Server or network slow, increase timeout if possible
- **403/401**: Authentication required
- **CORS errors**: Target doesn't allow requests
- **SSL errors**: Certificate issues

### Example Prompts
```
"Fetch https://api.github.com/zen"
"Get the weather from wttr.in/?format=j1"
"Call the JSONPlaceholder API and get user 1's info"
"Check if https://example.com is responding"
```

---

## GitHub Server

### Installation
```bash
npm install -g @modelcontextprotocol/server-github
```

### Configuration
```json
{
  "mcpServers": {
    "github": {
      "command": "mcp-server-github",
      "env": {
        "GITHUB_TOKEN": "ghp_your_token_here"
      }
    }
  }
}
```

### Getting a Token
1. Go to GitHub Settings → Developer settings → Personal access tokens
2. Generate new token (classic)
3. Select scopes: `repo`, `read:org`, `read:user`
4. Copy token immediately (only shown once)
5. Add to config

### Capabilities
- **Repository info** - Stars, language, description
- **Issues** - List, read, search issues
- **Pull requests** - View PRs and reviews
- **Code search** - Find code across repos
- **User info** - Profile and repositories

### Without Token
- Lower rate limits (60 requests/hour)
- Only public repositories
- No authenticated operations

### With Token
- Higher rate limits (5000 requests/hour)
- Access to private repos (if token has permission)
- Create issues, PRs (if token has permission)

### Best Practices
- Use token for better rate limits
- Rotate tokens regularly
- Don't commit tokens to git
- Use minimal required scopes
- Keep token secure

### Common Issues
- **Rate limited**: Add token or wait for reset
- **404 on private repo**: Token needs repo scope
- **Token invalid**: Regenerate token on GitHub

### Example Prompts
```
"Show me info about the repository anthropics/anthropic-sdk-python"
"List open issues in python/cpython"
"Search for repositories about 'model context protocol'"
"What are my GitHub repositories?" (requires token)
```

---

## SQLite Server

### Installation
```bash
npm install -g @modelcontextprotocol/server-sqlite
```

### Configuration
```json
{
  "mcpServers": {
    "sqlite": {
      "command": "mcp-server-sqlite",
      "args": [
        "/path/to/database/directory"
      ]
    }
  }
}
```

### Capabilities
- **Query** - SELECT statements
- **Insert** - Add new rows
- **Update** - Modify existing data
- **Delete** - Remove rows
- **Create** - New tables and schemas
- **Schema** - View table structures

### Safety
- Only accesses .db files in specified directory
- No access to system databases
- Transactions can be rolled back
- Read queries are safe

### Best Practices
- **Back up databases** before write operations
- Test queries on copies first
- Use transactions for multiple operations
- Verify schema before inserting
- Export important data regularly

### Common Issues
- **Database locked**: Close other connections
- **No such table**: Verify database file and table name
- **Syntax error**: Check SQL syntax
- **Permission denied**: Check file permissions

### Example Prompts
```
"Show me the schema of the users table in app.db"
"Query all rows from the tasks table"
"Create a new table called projects with id, name, and status columns"
"Insert a new user into the users table"
```

---

## Puppeteer Server

### Installation
```bash
npm install -g @modelcontextprotocol/server-puppeteer
```

**Additional requirements:**
- Chrome or Chromium browser
- Sufficient system memory
- May need additional libraries on Linux

### Configuration
```json
{
  "mcpServers": {
    "puppeteer": {
      "command": "mcp-server-puppeteer"
    }
  }
}
```

### Capabilities
- **Navigate** - Go to URLs
- **Screenshot** - Capture page images
- **Extract** - Get page content/data
- **Interact** - Click, type, submit forms
- **Wait** - For elements to load
- **PDF** - Generate PDFs from pages

### Limitations
- **Anti-bot detection** - Some sites block automation
- **Speed** - Slower than direct HTTP
- **Resources** - Uses significant memory
- **Complexity** - More error-prone than fetch

### Legal/Ethical Considerations
- ⚠️ Respect website Terms of Service
- ⚠️ Don't scrape personal data
- ⚠️ Respect robots.txt
- ⚠️ Rate limit your requests
- ⚠️ Some sites prohibit automation

### Best Practices
- Use fetch server when possible (faster, simpler)
- Add delays between actions
- Handle popups and dialogs
- Check for anti-bot measures
- Verify data before saving

### Common Issues
- **Browser won't launch**: Install Chrome/Chromium
- **Elements not found**: Page still loading, add wait
- **Automation detected**: Site blocks automation
- **Memory issues**: Close browser between operations

### Example Prompts
```
"Go to example.com and take a screenshot"
"Extract the headlines from news.ycombinator.com"
"Navigate to GitHub and get the trending repositories"
```

### When NOT to Use
- Simple API calls (use fetch instead)
- Large-scale scraping (use specialized tools)
- Real-time data (APIs are faster)
- Sites with official APIs (always prefer APIs)

---

## Memory Server

### Installation
```bash
npm install -g @modelcontextprotocol/server-memory
```

### Configuration
```json
{
  "mcpServers": {
    "memory": {
      "command": "mcp-server-memory",
      "args": []
    }
  }
}
```

### Capabilities
- **Store** - Save information for later
- **Retrieve** - Access stored information
- **Update** - Modify saved data
- **Organize** - Categorize memories
- **Persist** - Data survives restarts

### Use Cases
- **Project context** - Remember ongoing work
- **Preferences** - Store user preferences
- **Knowledge base** - Build personal wiki
- **Task tracking** - Long-term TODO lists
- **Learning** - Remember past conversations

### Storage Location
Data is stored locally in your home directory (exact location varies by implementation).

### Privacy
- All data stays on your machine
- Not sent to external servers
- You control the storage location

### Best Practices
- Organize with clear categories
- Regular backups of memory storage
- Clean up old/irrelevant data
- Use descriptive keys
- Don't store sensitive passwords

### Common Issues
- **Storage full**: Clean up old memories
- **Can't find data**: Check key names
- **Lost data**: Back up memory storage

### Example Prompts
```
"Remember that I prefer concise responses"
"What do you remember about my current project?"
"Store this API endpoint for future use: https://api.example.com"
"Update my preferred programming language to Rust"
```

---

## Sequential Thinking Server

### Installation
```bash
npm install -g @modelcontextprotocol/server-sequential-thinking
```

### Configuration
```json
{
  "mcpServers": {
    "sequential-thinking": {
      "command": "mcp-server-sequential-thinking"
    }
  }
}
```

### What It Does
Enhances AI reasoning by:
- Breaking complex tasks into steps
- Showing thought process
- Better handling of multi-step problems
- Improved logical reasoning

### Usage
Works automatically once configured. No special prompts needed.

### Best For
- Complex problem solving
- Multi-step workflows
- Debugging
- Planning and design
- Mathematical reasoning

### No Additional Configuration
Just install and add to config. The AI will automatically use enhanced reasoning.

### Example Scenarios
- "Debug this complex error"
- "Plan a multi-phase project"
- "Solve this logic puzzle"
- "Design a system architecture"

The AI will show more detailed step-by-step thinking.

---

## Combining Servers

### Common Combinations

**Research Workflow**
- fetch + filesystem: Download data, save locally
- github + filesystem: Clone repo info, save notes

**Data Pipeline**
- fetch + sqlite: API data to database
- filesystem + sqlite: Files to structured data

**Web Automation**
- puppeteer + filesystem: Scrape and save
- puppeteer + memory: Remember scraping patterns

**Development**
- github + filesystem: Code analysis
- sequential-thinking + filesystem: Complex refactoring

### Multi-Server Prompts
```
"Fetch the latest release info from GitHub and save it to releases.json"
"Read config.json, query the database, and create a report"
"Scrape this site, extract data, and store it in SQLite"
```

---

## Performance Tips

1. **Filesystem** - Fast, but large operations can be slow
2. **Fetch** - Network-dependent, cache when possible
3. **GitHub** - Mind rate limits, use tokens
4. **SQLite** - Fast for small/medium databases
5. **Puppeteer** - Slow, use sparingly
6. **Memory** - Fast, but don't overload
7. **Sequential-thinking** - Minimal overhead

---

## Security Considerations

- **Filesystem**: Don't give access to system directories
- **Fetch**: Be careful with authenticated requests
- **GitHub**: Rotate tokens, use minimal scopes
- **SQLite**: Back up before destructive operations
- **Puppeteer**: Don't input sensitive data on untrusted sites
- **Memory**: Don't store passwords or secrets
- **All**: Keep your MCP config file secure

---

## Getting Help

- Troubleshooting: `../troubleshooting/common-issues.md`
- Examples: `../examples/`
- Testing: `../sandbox/`
- Issues: Open on GitHub repo

---

## Server Updates

Check for updates periodically:
```bash
npm outdated -g | grep modelcontextprotocol
npm update -g @modelcontextprotocol/server-filesystem
```

New features and bug fixes are released regularly.
