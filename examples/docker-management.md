# Docker Management with MCP Docker Server

**Advanced:** Container management through your AI assistant.

## Prerequisites

```bash
# Install Docker server (if available)
npm install -g @modelcontextprotocol/server-docker
```

Add to your MCP config:
```json
{
  "mcpServers": {
    "docker": {
      "command": "mcp-server-docker"
    }
  }
}
```

**Note:** Requires Docker installed and running on your system.

---

## Container Management

### List Running Containers
**Prompt:**
```
Show me all running Docker containers.
```

---

### Start/Stop Containers
**Prompt:**
```
Stop the container named "my-app"
```

**Prompt:**
```
Start the container "database-server"
```

---

### Container Status
**Prompt:**
```
Check if the "postgres" container is running and show its status.
```

---

## Image Management

### List Images
**Prompt:**
```
List all Docker images on this system.
```

---

### Pull Images
**Prompt:**
```
Pull the latest nginx image from Docker Hub.
```

---

### Remove Unused Images
**Prompt:**
```
Show me all unused Docker images and their sizes.
```

---

## Practical Workflows

### Development Environment Setup
**Prompt:**
```
1. Check if postgres and redis containers are running
2. If not, start them
3. Show me their status and ports
```

**Use case:** Quick dev environment startup

---

### Container Health Check
**Prompt:**
```
Check the health and resource usage of these containers:
- web-server
- api-server
- database

Create a status report.
```

**Use case:** Monitoring

---

### Cleanup
**Prompt:**
```
Find all stopped containers and list them.
Tell me how much disk space they're using.
Ask before removing them.
```

**Use case:** Disk management

---

## Log Analysis

### View Container Logs
**Prompt:**
```
Show me the last 50 lines of logs from the "api-server" container.
```

---

### Search Logs for Errors
**Prompt:**
```
Check the logs of "web-app" container for any error messages in the last hour.
```

---

### Multi-Container Log Summary
**Prompt:**
```
Check logs from all running containers and tell me if any show errors or warnings.
```

---

## Network Management

### List Networks
**Prompt:**
```
Show me all Docker networks and which containers are connected to them.
```

---

### Container Networking
**Prompt:**
```
Tell me what network the "database" container is on and what other containers can reach it.
```

---

## Volume Management

### List Volumes
**Prompt:**
```
Show me all Docker volumes and their sizes.
```

---

### Volume Usage
**Prompt:**
```
Which containers are using the volume "app-data"?
```

---

## Compose Workflows

### Compose Status
**Prompt:**
```
In the ~/projects/myapp directory, check the docker-compose.yml
and tell me if all defined services are running.
```

---

### Compose Management
**Prompt:**
```
Navigate to ~/projects/webapp and:
1. Show me what's in docker-compose.yml
2. Check which services are running
3. Restart any stopped services
```

---

## Advanced Use Cases

### Resource Monitoring
**Prompt:**
```
Monitor CPU and memory usage of all running containers.
Alert me if any container is using more than 80% of available memory.
```

---

### Automated Deployment Check
**Prompt:**
```
After I deploy:
1. Check if the new "app-v2" container started successfully
2. Verify it's healthy
3. Check its logs for startup errors
4. Compare its resource usage to "app-v1"
```

---

### Container Comparison
**Prompt:**
```
Compare these two containers:
- app-staging
- app-production

Tell me if they're running the same image version and have the same configuration.
```

---

## Safety Considerations

⚠️ **Important:**

1. **Production systems** - Be extremely careful with production containers
2. **Data loss** - Removing containers can delete data
3. **Network access** - AI has significant container control
4. **Secrets** - Don't expose container environment variables with secrets
5. **Resource limits** - Pulling large images uses disk space

---

## Best Practices

✅ **Do:**
- Use for development environments
- Monitor before taking action
- Back up data before removing containers
- Test commands in staging first
- Use specific container names

❌ **Don't:**
- Blindly remove containers
- Expose production systems without safeguards
- Share logs that contain secrets
- Force-remove without checking dependencies
- Make changes during peak hours (production)

---

## Common Workflows

### Daily Dev Startup
**Prompt:**
```
Start my development environment:
1. Start postgres container
2. Start redis container
3. Start api-server container
4. Show me their status and logs
5. Tell me when everything is ready
```

---

### Pre-Deploy Check
**Prompt:**
```
Before deploying:
1. Check disk space
2. Verify all required images are pulled
3. Check if any containers will conflict with ports
4. Create a pre-deploy status report
```

---

### Cleanup Routine
**Prompt:**
```
Weekly cleanup:
1. List all stopped containers
2. List unused images
3. List dangling volumes
4. Calculate total reclaimable space
5. Ask before removing anything
```

---

## Integration with Other Servers

### With Filesystem
**Prompt:**
```
1. Check logs of "api-server" container
2. Extract any error messages
3. Save them to ~/logs/api-errors-[date].txt
```

---

### With Fetch
**Prompt:**
```
1. Start the "web-server" container
2. Wait 10 seconds
3. Use fetch to check if http://localhost:8080 is responding
4. Report the status
```

---

## Troubleshooting

### Container Won't Start
**Prompt:**
```
The "database" container won't start. Help me debug by:
1. Checking the logs
2. Verifying the image exists
3. Checking for port conflicts
4. Suggesting solutions
```

---

### Performance Issues
**Prompt:**
```
One of my containers is running slowly. Help me:
1. Identify which container is using most resources
2. Check its logs for issues
3. Compare its performance to normal
```

---

## Limitations

- Not all Docker operations may be available
- Requires Docker daemon access
- May need elevated permissions
- Some operations can be slow
- Security restrictions may apply

---

## When to Use Docker Server

✅ **Good for:**
- Development environment management
- Container monitoring
- Log analysis
- Status checks
- Basic container operations

❌ **Not ideal for:**
- Complex orchestration (use K8s tools)
- Production deployments (use CI/CD)
- Fine-grained control (use Docker CLI)
- High-security environments

---

## Next Steps

- Combine with filesystem for automated logging
- Build monitoring dashboards
- Create automated health checks
- Set up development environment automation

See `basic-file-operations.md` for filesystem integration.
