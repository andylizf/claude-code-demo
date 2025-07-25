# Claude Code Simple Demo

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
claude -p "check this code for bugs" --output-format stream-json < bad.js

# Use in scripts
echo "console.log(x)" | claude -p "is this code correct?" --output-format stream-json
```

## 3. CI/CD Integration

### Local (Pre-commit Hook)
```bash
# Setup local CI
chmod +x setup-ci.sh
./setup-ci.sh

# Now Claude checks your code before every commit!
```

### GitHub Actions
```yaml
# .github/workflows/simple-check.yml
# Runs automatically on push/PR
# See the workflow files for details
```

## Try It

1. **Test headless mode**: `./demo.sh`
2. **Setup local CI**: `./setup-ci.sh`
3. **Push to GitHub**: Actions will run automatically

That's it! 🎉 