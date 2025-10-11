# Basic File Operations with MCP Filesystem Server

Common patterns for working with files through your AI assistant.

## Reading Files

### Read a Single File
**Use case:** Check file contents without opening an editor

**Prompt:**
```
Read the contents of ~/Documents/notes.txt and summarize it for me.
```

**What happens:**
AI reads the file and provides a summary.

---

### Read Multiple Files
**Use case:** Compare or analyze several files

**Prompt:**
```
Read both config.json and config-backup.json and tell me what's different between them.
```

**What happens:**
AI reads both files and highlights differences.

---

### Read and Extract Information
**Use case:** Pull specific data from files

**Prompt:**
```
Read package.json and tell me what the current version number is.
```

**What happens:**
AI extracts just the info you need.

---

## Writing Files

### Create a New File
**Use case:** Generate files through conversation

**Prompt:**
```
Create a file called meeting-notes.md with these headings:
- Attendees
- Discussion Points
- Action Items
- Next Meeting
```

**What happens:**
AI creates a formatted markdown file.

---

### Update Existing File
**Use case:** Make targeted changes

**Prompt:**
```
Add a new entry to my todo.txt file: "Update MCP configuration"
```

**What happens:**
AI appends to the existing file.

---

### Replace Content
**Use case:** Overwrite with new content

**Prompt:**
```
Replace the contents of status.txt with "System operational as of [current date]"
```

**What happens:**
AI overwrites the file with new content.

---

## File Organization

### List Files
**Use case:** See what's in a directory

**Prompt:**
```
List all markdown files in my ~/Documents folder.
```

**What happens:**
AI shows all .md files.

---

### Search for Files
**Use case:** Find specific files

**Prompt:**
```
Find all files containing the word "budget" in my ~/Documents directory.
```

**What happens:**
AI searches file names and possibly contents.

---

### Organize Files
**Use case:** Clean up directories

**Prompt:**
```
Look at my ~/Downloads folder and suggest how to organize the files by type.
```

**What happens:**
AI analyzes files and provides organization suggestions.

---

## Practical Workflows

### Daily Log
**Prompt:**
```
Add an entry to my daily-log.md file with today's date and these accomplishments:
- Completed MCP setup
- Tested filesystem server
- Organized project files
```

**Result:**
Automated journal keeping.

---

### Config Backup
**Prompt:**
```
1. Read my current .zshrc file
2. Create a backup called .zshrc.backup
3. Tell me the file size of both
```

**Result:**
Safe config file management.

---

### Document Generation
**Prompt:**
```
Create a project README.md with:
- Project name: My MCP Project
- Description: Testing MCP filesystem server
- Installation steps
- Usage examples
```

**Result:**
AI writes formatted documentation.

---

### Code Review Helper
**Prompt:**
```
Read main.py and list any TODO comments or potential issues you notice.
```

**Result:**
Quick code analysis.

---

### Bulk File Analysis
**Prompt:**
```
Read all .log files in ~/logs and tell me if there are any error messages.
```

**Result:**
Automated log analysis.

---

## Advanced Patterns

### Template Expansion
**Prompt:**
```
Use template.md as a template and create three new files:
- project-a-report.md
- project-b-report.md
- project-c-report.md
Each should have the same structure but with the project name filled in.
```

**Result:**
Bulk file generation from templates.

---

### Data Extraction
**Prompt:**
```
Read all CSV files in ~/data and create a summary document listing:
- File name
- Number of rows
- Column headers
- Date range if applicable
```

**Result:**
Dataset documentation.

---

### File Comparison
**Prompt:**
```
Compare the dependencies in package.json with the ones actually imported in src/main.js and tell me if there are unused packages.
```

**Result:**
Dependency audit.

---

## Safety Tips

1. **Test with copies first** - Don't modify original files until confident
2. **Use version control** - Git can undo AI changes
3. **Review before executing** - Check AI's plan before confirming
4. **Start with read-only** - Practice reading before writing
5. **Backup important data** - Always have backups

---

## Common Pitfalls

❌ **Don't:** Give AI access to system directories (`/etc`, `/usr`, etc.)
✅ **Do:** Limit access to user directories only

❌ **Don't:** Trust AI blindly with irreplaceable files
✅ **Do:** Test workflows on sample data first

❌ **Don't:** Forget to verify paths in prompts
✅ **Do:** Use absolute paths or clearly state the location

---

## Next Steps

Once comfortable with basic operations:
- Try multi-step workflows
- Combine filesystem with fetch server
- Automate repetitive file tasks
- Build custom document generation systems

See `api-calling-patterns.md` for fetch server examples.
