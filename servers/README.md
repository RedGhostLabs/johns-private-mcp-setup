# Red Ghost Custom MCP Server

This directory contains a minimal example of a custom Model Context Protocol (MCP) server designed for the **Red Ghost Defense** stack.  The goal is to demonstrate how you can extend Sid’s MCP starter kit with your own functionality.

## What It Does

The provided `index.js` script listens for JSON‑formatted requests on `STDIN` and responds with a simple object that includes the action name and a timestamp.  It acts as a lightweight bridge between your AI assistant (Claude, ChatGPT, etc.) and any local services or tools you wish to integrate.

You can expand this server to:

- Trigger n8n workflows.
- Call local APIs (e.g., an Ollama instance).
- Run shell commands or scripts.
- Process data and return results back to the AI.

## Installation

From the repository root, run:

```bash
chmod +x servers/install-redghost-custom.sh
./servers/install-redghost-custom.sh
```

This will install the package globally under the command name `mcp-server-redghost-custom`.  Ensure you have Node.js and npm installed first.

## Configuration

Add the following to your AI’s MCP configuration file (e.g., `claude_desktop_config.json`):

```json
{
  "mcpServers": {
    "redghost": {
      "command": "mcp-server-redghost-custom"
    }
  }
}
```

Once the AI is restarted, you can test the server by sending a message like:

```
Call the redghost server with the action "ping"
```

If everything is wired correctly, you should receive a JSON response that includes the action and a timestamp.

## Extending This Server

The `index.js` file is intentionally simple.  To integrate real functionality:

1. Parse the `request` object to determine which action to perform.
2. Implement logic for each action (e.g., call a local API, execute a shell command).
3. Return a JSON‑serialisable object as the response.

Refer to the official [Model Context Protocol documentation](https://modelcontextprotocol.io/) for details on the request/response schema and security considerations.

---

*Made with ❤️ by Red Ghost Defense*