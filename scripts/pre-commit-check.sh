#!/bin/bash
# pre-commit-check.sh - Quality gate helper
# Customize the commands below for your project

echo "Pre-commit quality checks..."
echo ""

# Lint (customize for your project)
echo "1. Lint check:"
if command -v swiftlint &> /dev/null; then
    swiftlint 2>&1 | head -10 || true
elif [ -f "package.json" ]; then
    npm run lint 2>&1 | head -10 || true
else
    echo "   (no linter configured)"
fi
echo ""

# Tests (customize for your project)
echo "2. Test check:"
if [ -f "Package.swift" ]; then
    swift test 2>&1 | tail -5 || true
elif [ -f "package.json" ]; then
    npm test 2>&1 | tail -5 || true
else
    echo "   (no test runner configured)"
fi
echo ""

# Debug statement check
echo "3. Debug statements in staged files:"
DEBUGS=$(git diff --cached --name-only 2>/dev/null | xargs grep -l "console\.log\|print(" 2>/dev/null || true)
if [ -n "$DEBUGS" ]; then
    echo "   Found in: $DEBUGS"
else
    echo "   None found"
fi
echo ""

echo "Done. Review any issues above before committing."
