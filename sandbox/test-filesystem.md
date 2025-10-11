# Filesystem Server Test Suite

Detailed tests for the MCP filesystem server.

## Prerequisites

1. Filesystem server installed: `npm install -g @modelcontextprotocol/server-filesystem`
2. Config points to test directory (e.g., `~/mcp-test`)
3. Test environment created (run `./setup-test-environment.sh`)
4. AI application restarted

---

## Test 1: Read Single File

**Prompt:**
```
Read the file test-file.txt and tell me what it contains.
```

**Expected Result:**
AI reads and displays the file content.

**Verification:**
Content should match what's in `~/mcp-test/test-file.txt`

---

## Test 2: List Directory Contents

**Prompt:**
```
List all files and folders in the test directory.
```

**Expected Result:**
Shows files like test-file.txt, another-file.md, etc.

**Verification:**
Compare with `ls ~/mcp-test`

---

## Test 3: Create New File

**Prompt:**
```
Create a file called my-test.txt with the content "This is a test file created by my AI assistant."
```

**Expected Result:**
AI creates the file successfully.

**Verification:**
```bash
cat ~/mcp-test/my-test.txt
```

---

## Test 4: Modify Existing File

**Prompt:**
```
Append the line "Modified by AI" to test-file.txt
```

**Expected Result:**
AI appends text to existing file.

**Verification:**
```bash
cat ~/mcp-test/test-file.txt
# Should show original content plus new line
```

---

## Test 5: Search for Files

**Prompt:**
```
Find all .txt files in the test directory.
```

**Expected Result:**
Lists test-file.txt, my-test.txt, etc.

**Verification:**
```bash
find ~/mcp-test -name "*.txt"
```

---

## Test 6: Read Subdirectory

**Prompt:**
```
What files are in the 'subdir' folder within the test directory?
```

**Expected Result:**
Lists contents of ~/mcp-test/subdir/

**Verification:**
```bash
ls ~/mcp-test/subdir/
```

---

## Test 7: Create Directory

**Prompt:**
```
Create a new folder called 'my-folder' in the test directory.
```

**Expected Result:**
AI creates directory.

**Verification:**
```bash
ls -la ~/mcp-test/ | grep my-folder
```

---

## Test 8: File Information

**Prompt:**
```
Tell me the size and last modified date of test-file.txt
```

**Expected Result:**
AI provides file metadata.

**Verification:**
```bash
ls -lh ~/mcp-test/test-file.txt
```

---

## Test 9: Multiple Operations

**Prompt:**
```
1. Create a file called todo.txt
2. Write "Task 1: Test MCP" to it
3. Read it back to confirm
4. Add another line "Task 2: Complete setup"
5. Read the final version
```

**Expected Result:**
AI performs all operations in sequence.

**Verification:**
```bash
cat ~/mcp-test/todo.txt
# Should contain both tasks
```

---

## Test 10: Error Handling

**Prompt:**
```
Try to read a file called nonexistent-file.txt
```

**Expected Result:**
AI reports file doesn't exist (graceful error).

**Verification:**
Error message should be clear, not a crash.

---

## Troubleshooting

### AI says "I don't have access"
- Check config has correct path
- Verify path exists: `ls ~/mcp-test`
- Restart AI application completely

### AI can read but not write
- Check directory permissions: `ls -la ~/ | grep mcp-test`
- Should be writable by your user
- Try: `chmod 755 ~/mcp-test`

### Server not found
- Verify installation: `npm list -g @modelcontextprotocol/server-filesystem`
- Check PATH: `which mcp-server-filesystem`
- Reinstall if needed

---

## Success Criteria

✅ All 10 tests pass
✅ AI can read, write, and search files
✅ Errors are handled gracefully
✅ Operations complete quickly (< 2 seconds each)

If all tests pass, you're ready to use filesystem server with real directories!
