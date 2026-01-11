#!/bin/bash
# setup-github-labels.sh
# Creates a standardized set of GitHub labels for Claude Code project workflows
#
# Usage: ./setup-github-labels.sh [--delete-defaults]
#   --delete-defaults: Remove GitHub's default labels before creating custom ones

set -e

# Check if gh CLI is available
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed."
    echo "Install it from: https://cli.github.com/"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "Error: Not authenticated with GitHub CLI."
    echo "Run: gh auth login"
    exit 1
fi

# Check if we're in a git repo
if ! git rev-parse --git-dir &> /dev/null; then
    echo "Error: Not in a git repository."
    exit 1
fi

DELETE_DEFAULTS=false
if [[ "$1" == "--delete-defaults" ]]; then
    DELETE_DEFAULTS=true
fi

# Function to create or update a label
create_label() {
    local name="$1"
    local color="$2"
    local description="$3"

    # Try to create, if exists update instead
    if gh label create "$name" --color "$color" --description "$description" 2>/dev/null; then
        echo "✓ Created: $name"
    else
        gh label edit "$name" --color "$color" --description "$description" 2>/dev/null && \
            echo "✓ Updated: $name" || \
            echo "✗ Failed: $name"
    fi
}

# Delete default GitHub labels if requested
if [[ "$DELETE_DEFAULTS" == true ]]; then
    echo "Removing default GitHub labels..."
    for label in "bug" "documentation" "duplicate" "enhancement" "good first issue" \
                 "help wanted" "invalid" "question" "wontfix"; do
        gh label delete "$label" --yes 2>/dev/null && echo "  Deleted: $label" || true
    done
    echo ""
fi

echo "Creating project labels..."
echo ""

# Priority labels
echo "Priority labels:"
create_label "P0" "B60205" "Critical - drop everything"
create_label "P1" "D93F0B" "High priority - fix this sprint"
create_label "P2" "FBCA04" "Medium priority - plan for soon"
create_label "P3" "0E8A16" "Low priority - backlog"
echo ""

# Type labels
echo "Type labels:"
create_label "bug" "D73A4A" "Something isn't working"
create_label "enhancement" "A2EEEF" "New feature or request"
create_label "tech-debt" "D4C5F9" "Code quality improvement"
create_label "ux" "F9D0C4" "User experience issue"
create_label "refactor" "7057FF" "Code refactoring without behavior change"
echo ""

# Status labels
echo "Status labels:"
create_label "triage" "EDEDED" "Needs review and prioritization"
create_label "in-progress" "0052CC" "Currently being worked on"
create_label "blocked" "FEF2C0" "Blocked by external dependency"
echo ""

# Phase labels (customize these per project)
echo "Phase labels:"
create_label "phase-1" "C5DEF5" "Phase 1 work"
create_label "phase-2" "C5DEF5" "Phase 2 work"
create_label "phase-3" "C5DEF5" "Phase 3 work"
echo ""

# Standard labels (keeping some useful defaults)
echo "Standard labels:"
create_label "duplicate" "CFD3D7" "This issue or PR already exists"
create_label "invalid" "E4E669" "This doesn't seem right"
create_label "wontfix" "FFFFFF" "This will not be worked on"
create_label "help wanted" "008672" "Extra attention is needed"
create_label "good first issue" "7057FF" "Good for newcomers"
echo ""

echo "Done! Labels have been set up for your repository."
echo ""
echo "Tip: Customize phase labels by editing this script or running:"
echo "  gh label edit 'phase-1' --name 'phase-mvp' --description 'MVP phase'"
