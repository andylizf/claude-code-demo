#!/bin/bash

echo "=== Claude Code Headless Mode Demo ==="
echo
echo "Note: Make sure ANTHROPIC_API_KEY is set!"
echo

# Example 1: Check for bugs
echo "1. Checking for bugs:"
claude -p "find bugs in this code: $(cat bad.js)" 2>/dev/null || echo "Set ANTHROPIC_API_KEY first"
echo

# Example 2: Generate documentation  
echo "2. Generate docs:"
echo "function add(a, b) { return a + b; }" | claude -p "add JSDoc comment to this function"
echo

# Example 3: Security check
echo "3. Security check:"
echo "eval(userInput)" | claude -p "is this code secure? explain why or why not" 