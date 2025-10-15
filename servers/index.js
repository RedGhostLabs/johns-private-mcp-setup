#!/usr/bin/env node

/*
 * Red Ghost Custom MCP Server
 *
 * This is a minimal example of a custom Model Context Protocol (MCP) server.  It
 * listens for JSON-formatted requests on STDIN and writes JSON responses to
 * STDOUT.  The intent is to provide a simple hook for Red Ghost Defense
 * workflows—bridge to a local tool, call an API, or return custom data.
 *
 * You can expand this script to call other programs (e.g., n8n workflows,
 * shell scripts, or Python utilities) or interface with local services like
 * Ollama.  For now, it echoes back the action name to demonstrate the flow.
 */

const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false,
});

// Process each incoming line as a JSON message
rl.on('line', (line) => {
  let request;
  try {
    request = JSON.parse(line);
  } catch (err) {
    // Write an error response if JSON cannot be parsed
    const errorResponse = {
      error: `Invalid JSON input: ${err.message}`,
    };
    process.stdout.write(JSON.stringify(errorResponse) + '\n');
    return;
  }

  // Determine the action from the request; default to 'unknown'
  const action = request.action || 'unknown';

  // Placeholder: implement your custom logic here.  For example,
  // you could call a local API, run a command, or trigger an n8n workflow.
  // The returned object should be JSON-serialisable.
  const response = {
    result: `Hello from Red Ghost custom server! Action: ${action}`,
    timestamp: new Date().toISOString(),
  };

  process.stdout.write(JSON.stringify(response) + '\n');
});