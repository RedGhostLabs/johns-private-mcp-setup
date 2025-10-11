# API Calling Patterns with MCP Fetch Server

How to use the fetch server to call APIs through your AI assistant.

## Basic API Calls

### Simple GET Request
**Use case:** Fetch data from a public API

**Prompt:**
```
Fetch data from https://api.github.com/zen and show me the response.
```

**What happens:**
AI makes the request and displays the result.

---

### GET with Path Parameters
**Use case:** Fetch specific resource

**Prompt:**
```
Get information about the user "anthropics" from the GitHub API.
```

**What happens:**
AI constructs the correct URL (https://api.github.com/users/anthropics) and fetches data.

---

### Check API Status
**Use case:** Verify service availability

**Prompt:**
```
Check if the API at https://api.example.com is responding.
```

**What happens:**
AI attempts connection and reports status.

---

## Working with JSON APIs

### Parse API Response
**Use case:** Extract specific data from API

**Prompt:**
```
Fetch https://jsonplaceholder.typicode.com/users/1 and tell me the user's name and email.
```

**What happens:**
AI parses JSON and extracts requested fields.

---

### Multiple Endpoints
**Use case:** Gather data from several sources

**Prompt:**
```
Get the latest 5 posts from https://jsonplaceholder.typicode.com/posts
and for each one, tell me the title and user ID.
```

**What happens:**
AI fetches and processes list data.

---

### Data Transformation
**Use case:** Reformat API data

**Prompt:**
```
Fetch the current weather for London from wttr.in/?format=j1
and create a simple summary of temperature, conditions, and humidity.
```

**What happens:**
AI fetches JSON and reformats it into readable text.

---

## GitHub API Examples

### Repository Information
**Prompt:**
```
Get information about the repository anthropics/anthropic-sdk-python
from GitHub and tell me:
- Number of stars
- Primary language
- Last update date
```

**What happens:**
AI uses GitHub API to fetch repo data.

---

### List Issues
**Prompt:**
```
Show me the 5 most recent open issues from the repository python/cpython.
```

**What happens:**
AI fetches and displays issue list.

---

### Search Repositories
**Prompt:**
```
Search GitHub for repositories related to "model context protocol"
and show me the top 3 results.
```

**What happens:**
AI uses GitHub search API.

---

## Research Workflows

### API Documentation Reading
**Prompt:**
```
Fetch the README from https://raw.githubusercontent.com/anthropics/anthropic-sdk-python/main/README.md
and summarize the installation steps.
```

**Result:**
Quick documentation summaries.

---

### Technology Research
**Prompt:**
```
Look up the latest release information for the npm package "@modelcontextprotocol/server-filesystem"
using the npm registry API and tell me the version number.
```

**Result:**
Automated version checking.

---

### API Comparison
**Prompt:**
```
1. Fetch weather data for New York from wttr.in
2. Compare it with weather data from another API
3. Tell me which one provides more detailed information
```

**Result:**
API evaluation.

---

## Practical Workflows

### Daily News Digest
**Prompt:**
```
Fetch the latest Hacker News top stories from the Hacker News API
and create a digest of the top 5 with titles and links.
```

**Result:**
Automated news aggregation.

---

### Package Version Checker
**Prompt:**
```
Check the latest versions of these npm packages:
- express
- react
- typescript
Tell me if any have major updates available.
```

**Result:**
Dependency monitoring.

---

### Status Dashboard
**Prompt:**
```
Check the status of these services:
- GitHub API
- npm registry
- PyPI

Create a simple status report.
```

**Result:**
Service monitoring.

---

### Content Aggregation
**Prompt:**
```
1. Fetch data from 3 different tech news APIs
2. Extract the headlines
3. Create a combined list sorted by relevance
4. Save it to tech-news-digest.md
```

**Result:**
Multi-source content curation.

---

## Advanced Patterns

### API with Authentication (using env vars)
**Note:** Store API keys in MCP config's env section

**Prompt:**
```
Using my GitHub token, fetch my private repositories and list them.
```

**Config setup:**
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

---

### Data Pipeline
**Prompt:**
```
1. Fetch user data from JSONPlaceholder API
2. Transform it into a CSV format
3. Save to users.csv
4. Create a summary showing:
   - Total users
   - Unique domains in emails
   - City distribution
```

**Result:**
Complete data processing pipeline.

---

### API Response Caching
**Prompt:**
```
Fetch the repository data for anthropics/claude-code.
If this request was made in the last hour, tell me to use cached data instead.
Otherwise, save the response to cache.json.
```

**Result:**
API rate limit management.

---

## Error Handling

### Graceful Failures
**Prompt:**
```
Try to fetch https://api.example.com/endpoint
If it fails, tell me why and suggest alternatives.
```

**Result:**
Better debugging information.

---

### Retry Logic
**Prompt:**
```
Fetch data from [unreliable-api-endpoint].
If it times out, wait 5 seconds and try again up to 3 times.
```

**Result:**
Resilient API calls.

---

## Combining with Filesystem

### Save API Response
**Prompt:**
```
Fetch the latest release info for anthropics/claude-code
and save it to releases/latest.json
```

---

### Process and Store
**Prompt:**
```
1. Fetch GitHub trending repositories
2. Extract: name, description, stars, language
3. Create a markdown report and save to reports/trending-[date].md
```

---

### Update Local Database
**Prompt:**
```
1. Fetch my GitHub repositories
2. Read my local repo-list.json
3. Update it with any new repos
4. Save the updated version
```

---

## Safety & Best Practices

✅ **Do:**
- Use public APIs for testing
- Check rate limits
- Handle errors gracefully
- Cache responses when appropriate
- Use environment variables for API keys

❌ **Don't:**
- Put API keys directly in prompts
- Hammer APIs with rapid requests
- Assume APIs are always available
- Trust API data blindly
- Share API responses with sensitive info

---

## Useful Public APIs for Testing

- **GitHub:** https://api.github.com
- **JSONPlaceholder:** https://jsonplaceholder.typicode.com
- **wttr.in:** https://wttr.in (weather)
- **Hacker News:** https://hacker-news.firebaseio.com/v0
- **Dog API:** https://dog.ceo/api/breeds/list/all

---

## Next Steps

- Combine fetch + filesystem for data pipelines
- Build custom RSS feed aggregators
- Create monitoring dashboards
- Automate research workflows

See `basic-file-operations.md` for filesystem examples.
