#!/bin/bash

echo "=== Claude Code Headless Mode Demo ==="
echo

# Example 1: Check for bugs
echo "1. Checking for bugs:"
claude -p "find bugs in this code" --output-format stream-json < bad.js
echo

# Example 2: Generate documentation  
echo "2. Generate docs:"
echo "function add(a, b) { return a + b; }" | claude -p "add JSDoc comment" --output-format stream-json
echo

# Example 3: Security check
echo "3. Security check:"
echo "eval(userInput)" | claude -p "is this code secure?" --output-format stream-json 