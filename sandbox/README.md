# Sandbox Testing Environment

This folder is your safe place to test MCP servers without breaking anything.

## Quick Setup

```bash
# Run the setup script to create test files
chmod +x sandbox/setup-test-environment.sh
./sandbox/setup-test-environment.sh
```

This creates a test directory with sample files you can safely experiment with.

---

## What's Here

- `README.md` - This file
- `sample-prompts.md` - Copy-paste prompts to test each server
- `test-filesystem.md` - Specific filesystem server tests
- `setup-test-environment.sh` - Auto-creates safe test environment

---

## Testing Workflow

### 1. Set up test environment
```bash
./sandbox/setup-test-environment.sh
```

### 2. Point your MCP config to the test folder
Edit your config to use `~/mcp-test` (or wherever the script created it)

### 3. Restart your AI

### 4. Run test prompts
Open `sample-prompts.md` and copy-paste prompts into your AI

### 5. Verify results
Check that your AI can actually read/write/manipulate the test files

---

## Why Test in Sandbox?

- **Safety:** Won't accidentally modify important files
- **Clean slate:** Easy to reset by re-running setup script
- **Learning:** Understand what each server can do
- **Debugging:** Isolate problems from your real workspace

---

## After Testing

Once everything works in the sandbox:
1. Update your config to point to real directories
2. Be careful with write permissions
3. Start small with real tasks
4. Build confidence before giving AI access to important files

---

## Reset the Sandbox

```bash
# Delete and recreate
rm -rf ~/mcp-test
./sandbox/setup-test-environment.sh
```
