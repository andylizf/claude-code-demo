# Claude Code Simple Demo

⚠️ **Setup Required**: You need an Anthropic API key. See [SETUP.md](SETUP.md) for detailed instructions.

## 1. Fix Linter Errors

```bash
# Look at the bad code
cat bad.js

# Ask Claude to fix it
claude "fix all linter errors in bad.js"
```

## 2. Headless Mode

```bash
# Run without interaction
claude -p "check this code for bugs" < bad.js

# Use in scripts
echo "console.log(x)" | claude -p "is this code correct?"
```

## 3. CI/CD Integration

### GitHub Actions Setup

1. **Add API Key**: Go to Settings → Secrets → Add `ANTHROPIC_API_KEY`
2. **Push Code**: Actions will run automatically
3. **View Results**: Check the Actions tab

### Local Pre-commit Hook
```bash
# Setup local CI
chmod +x setup-ci.sh
./setup-ci.sh

# Now Claude checks your code before every commit!
```

## Quick Start

1. **Fork this repo**
2. **Add your API key** to GitHub Secrets ([instructions](SETUP.md))
3. **Make a change** and push
4. **Watch Claude** analyze your code!

## Try It

1. **Test headless mode**: `./demo.sh`
2. **Setup local CI**: `./setup-ci.sh`
3. **Push to GitHub**: Actions will run automatically

That's it! 🎉 