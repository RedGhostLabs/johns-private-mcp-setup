# Web Automation with MCP Puppeteer Server

**Advanced:** Browser automation and web scraping examples.

## Prerequisites

```bash
npm install -g @modelcontextprotocol/server-puppeteer
```

Add to your MCP config:
```json
{
  "mcpServers": {
    "puppeteer": {
      "command": "mcp-server-puppeteer"
    }
  }
}
```

---

## Basic Browser Control

### Open a Website
**Prompt:**
```
Open https://example.com in a browser and tell me what the page title is.
```

---

### Take a Screenshot
**Prompt:**
```
Navigate to https://github.com/anthropics/claude-code
and take a screenshot. Save it as github-screenshot.png
```

---

### Extract Page Content
**Prompt:**
```
Go to https://news.ycombinator.com
and list the titles of the top 5 posts.
```

---

## Web Scraping

### Scrape Product Prices
**Prompt:**
```
Visit [product-page-url] and extract:
- Product name
- Current price
- Availability status
- Rating
```

**Use case:** Price monitoring

---

### News Headlines
**Prompt:**
```
Go to a news website and collect all headlines from the front page.
Save them to headlines-[date].md
```

**Use case:** News aggregation

---

### Table Data Extraction
**Prompt:**
```
Navigate to [page-with-table]
Extract the table data and convert it to CSV format.
```

**Use case:** Data collection

---

## Form Automation

### Fill and Submit Form
**Prompt:**
```
1. Go to the contact form at [url]
2. Fill in:
   - Name: Test User
   - Email: test@example.com
   - Message: This is a test
3. Take a screenshot before submitting
4. Submit the form (if safe)
```

**Use case:** Form testing

---

### Login Workflow
**Prompt:**
```
Navigate to the login page at [url]
Enter these credentials:
- Username: testuser
- Password: [from secure storage]
Verify successful login by checking for welcome message.
```

**Use case:** Authentication testing

---

## Monitoring & Testing

### Check for Changes
**Prompt:**
```
1. Visit [website-url]
2. Take a screenshot
3. Compare it with previous-screenshot.png
4. Tell me if anything has changed significantly
```

**Use case:** Website monitoring

---

### Performance Check
**Prompt:**
```
Load [website-url] and measure:
- Page load time
- Number of network requests
- Total page size
```

**Use case:** Performance monitoring

---

### Link Validation
**Prompt:**
```
Visit [webpage-url]
Find all links on the page and check if they're working.
Report any broken links.
```

**Use case:** Site maintenance

---

## Advanced Workflows

### Multi-Page Navigation
**Prompt:**
```
1. Go to an e-commerce site
2. Search for "laptop"
3. Click the first result
4. Extract product details
5. Save to products.json
```

---

### Infinite Scroll Scraping
**Prompt:**
```
Go to [social-media-feed]
Scroll down 5 times to load more content
Collect all post titles/descriptions
```

---

### PDF Generation
**Prompt:**
```
Navigate to [article-url]
Remove ads and navigation
Generate a clean PDF version
Save as article-clean.pdf
```

---

## Practical Use Cases

### Job Listings Aggregator
**Prompt:**
```
Visit these job boards:
- [site1]
- [site2]
- [site3]

For each, extract:
- Job title
- Company
- Location
- Posted date

Combine into a single jobs-[date].md file
```

---

### Documentation Archive
**Prompt:**
```
Navigate to [docs-site]
Save the main page and all linked pages as PDFs
Organize them in a docs/ folder
```

---

### Research Helper
**Prompt:**
```
Search for "Model Context Protocol" on multiple search engines
Collect the top 10 results from each
Remove duplicates
Save to research-links.md
```

---

## Safety & Ethics

⚠️ **Important Considerations:**

1. **Respect robots.txt** - Check site's scraping policy
2. **Rate limiting** - Don't hammer servers with requests
3. **Terms of Service** - Many sites prohibit scraping
4. **Personal data** - Don't scrape personal information
5. **Authentication** - Be careful with credentials
6. **Legal compliance** - Know your local laws

---

## Limitations

- Not all sites work with automation (anti-bot measures)
- Dynamic content may require special handling
- Some actions may trigger CAPTCHAs
- Private/authenticated content needs careful handling
- Browser automation can be slow

---

## Best Practices

✅ **Do:**
- Test on public sites first
- Add delays between actions
- Handle errors gracefully
- Respect site policies
- Use for legitimate purposes

❌ **Don't:**
- Scrape copyrighted content at scale
- Bypass authentication without permission
- Overload servers with requests
- Violate Terms of Service
- Store sensitive data insecurely

---

## Alternatives to Consider

Before using Puppeteer, consider if these are better:

- **fetch server** - For simple API calls (faster, cleaner)
- **curl/wget** - For downloading files
- **RSS feeds** - For news/blog monitoring
- **Official APIs** - Always prefer these over scraping

---

## Troubleshooting

### Browser won't launch
- Check Puppeteer installation
- Verify Chrome/Chromium is installed
- Check permissions

### Elements not found
- Page may still be loading (add delays)
- Check selectors are correct
- Site may use dynamic rendering

### Automation detected
- Some sites block automation
- May need stealth plugins
- Consider using official APIs instead

---

## Next Steps

Once comfortable:
- Build custom monitoring systems
- Automate repetitive web tasks
- Create data collection pipelines
- Combine with filesystem for storage

See `api-calling-patterns.md` for API alternatives.
