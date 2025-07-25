#!/bin/bash

echo "🚀 Setting up Claude Code CI/CD..."

# Check if API key is set
if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "⚠️  Warning: ANTHROPIC_API_KEY not set. The hook will need it to work."
    echo "   Export it in your shell: export ANTHROPIC_API_KEY='your-key-here'"
fi

# Create pre-commit hook
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
echo "🤖 Running Claude Code pre-commit checks..."

# Check if API key is available
if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "⚠️  ANTHROPIC_API_KEY not set. Skipping Claude checks."
    echo "   Set it with: export ANTHROPIC_API_KEY='your-key-here'"
    exit 0
fi

# Get staged files
FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.js$')

if [ -z "$FILES" ]; then
    echo "✅ No JS files to check"
    exit 0
fi

# Check each file
for file in $FILES; do
    echo "Checking: $file"
    
    # Run Claude check (simplified command)
    RESULT=$(claude -p "Find critical bugs in this code: $(cat "$file" | head -100)" 2>&1)
    
    if echo "$RESULT" | grep -qi "bug\|error\|vulnerability"; then
        echo "⚠️  Potential issues found in $file:"
        echo "$RESULT" | head -20
        echo ""
        echo "Fix with: claude 'fix the issues in $file'"
        echo "Or commit anyway with: git commit --no-verify"
        exit 1
    fi
done

echo "✅ All checks passed!"
EOF

chmod +x .git/hooks/pre-commit

echo "✅ Pre-commit hook installed!"
echo ""
echo "📝 Usage:"
echo "  - The hook will run automatically before each commit"
echo "  - Make sure to set: export ANTHROPIC_API_KEY='your-key'"
echo "  - To skip: git commit --no-verify"
echo ""
echo "🔧 GitHub Actions:"
echo "  - Add ANTHROPIC_API_KEY to your repo secrets"
echo "  - Push this repo to GitHub" 
echo "  - The workflows in .github/workflows/ will run automatically" 