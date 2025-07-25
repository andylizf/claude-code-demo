#!/bin/bash

echo "🚀 Setting up Claude Code CI/CD..."

# Create pre-commit hook
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
echo "🤖 Running Claude Code pre-commit checks..."

# Get staged files
FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.js$')

if [ -z "$FILES" ]; then
    echo "✅ No JS files to check"
    exit 0
fi

# Check each file
for file in $FILES; do
    echo "Checking: $file"
    
    # Run Claude check
    RESULT=$(claude -p "Find critical bugs in this code" --output-format stream-json < "$file" 2>/dev/null)
    
    if echo "$RESULT" | grep -q "bug\|error\|vulnerability"; then
        echo "❌ Issues found in $file:"
        echo "$RESULT"
        echo ""
        echo "Fix with: claude 'fix the issues in $file'"
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
echo "  - To skip: git commit --no-verify"
echo ""
echo "🔧 GitHub Actions:"
echo "  - Push this repo to GitHub" 
echo "  - The workflows in .github/workflows/ will run automatically" 