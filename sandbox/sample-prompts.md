# Sample Test Prompts

Copy-paste these into your AI to test each MCP server.

## Filesystem Server Tests

### Basic Read
```
List all files in the test directory you have access to.
```

### File Content
```
Read the contents of test-file.txt
```

### Write Test
```
Create a new file called hello.txt with the content "Hello from MCP!"
```

### Directory Navigation
```
Show me the directory structure of my test folder, including subdirectories.
```

### Search
```
Find all .md files in the test directory.
```

---

## Fetch Server Tests

### Simple GET Request
```
Fetch the content from https://api.github.com/zen
```

### API Call
```
Make a GET request to https://jsonplaceholder.typicode.com/posts/1 and show me the response.
```

### Check Status
```
Check if https://github.com is accessible.
```

---

## GitHub Server Tests

**Note:** Requires GITHUB_TOKEN in config

### Repository Info
```
Show me information about the repository: anthropics/anthropic-sdk-python
```

### List Issues
```
List the open issues for the repository: anthropics/anthropic-sdk-python
```

### Your Repos (if token has access)
```
List my GitHub repositories.
```

---

## SQLite Server Tests

**Note:** Requires a database path in config

### Create Table
```
Create a SQLite table called 'tasks' with columns: id (integer), title (text), completed (boolean).
```

### Insert Data
```
Insert a task into the tasks table: "Test MCP setup", not completed.
```

### Query Data
```
Show me all tasks from the tasks table.
```

---

## Combination Tests

### Multi-step Task
```
1. Create a file called api-response.txt
2. Fetch data from https://api.github.com/zen
3. Write that data to the file
4. Read the file back to verify
```

### Research and Document
```
Look up information about MCP servers and create a summary document.
```

---

## Troubleshooting Prompts

### Check Available Servers
```
What MCP servers do you have access to?
```

### Test Permissions
```
Do you have write access to the test directory?
```

### Verify Setup
```
Can you confirm which directories you have access to via the filesystem server?
```

---

## Expected Results

✅ **Working:** AI performs the action and reports results
❌ **Not Working:** AI says it doesn't have access or can't find the server

If tests fail, check:
1. Config syntax and paths
2. Server installation
3. AI application was fully restarted
4. Permissions on directories

See `../troubleshooting/common-issues.md` for help.
