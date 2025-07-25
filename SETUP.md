# Claude Code Setup Guide

## Prerequisites

1. **Anthropic API Key** - You need an API key from Anthropic
2. **GitHub Repository** - With Actions enabled

## Step 1: Get Your Anthropic API Key

1. Go to https://console.anthropic.com/
2. Sign up or log in
3. Navigate to API Keys section
4. Create a new API key
5. Copy the key (starts with `sk-ant-api03-...`)

## Step 2: Add API Key to GitHub Secrets

1. Go to your GitHub repository
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add:
   - Name: `ANTHROPIC_API_KEY`
   - Value: Your API key from Step 1
5. Click **Add secret**

## Step 3: Test the Setup

1. Make a small change to `bad.js`
2. Commit and push
3. Check the **Actions** tab in GitHub
4. You should see Claude Code running!

## Troubleshooting

### Error: "When using --print, --output-format=stream-json requires --verbose"
This has been fixed in our workflows. We now use simpler command syntax.

### Error: "API key not found"
Make sure you've added `ANTHROPIC_API_KEY` to your repository secrets.

### Claude Code not installing
The workflow now includes Node.js setup which is required for npm installation.

## Local Testing

To test Claude Code locally:

```bash
# Export your API key
export ANTHROPIC_API_KEY="your-api-key-here"

# Install Claude Code
npm install -g @anthropic-ai/claude-code

# Test it
claude -p "What is 2+2?"
```

## Cost Considerations

- Each API call uses tokens
- Monitor your usage at https://console.anthropic.com/
- Consider setting spending limits in your Anthropic account

## Security Notes

- Never commit API keys to your repository
- Use GitHub Secrets for all sensitive data
- API keys should have minimal required permissions 