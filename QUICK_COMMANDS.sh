#!/bin/bash
# Quick Commands for Bootstrap v2.0 Release
# Copy and paste these commands to create your PRs

echo "Bootstrap v2.0 - Quick Command Reference"
echo "=========================================="
echo ""
echo "Choose your approach:"
echo "  1. Two separate PRs (recommended for review)"
echo "  2. Single combined PR (faster to ship)"
echo ""

# ==============================================================================
# OPTION 1: TWO SEPARATE PRs
# ==============================================================================

pr1() {
    echo "Creating PR #1: Core Orchestration System"
    echo "------------------------------------------"

    git checkout main
    git pull origin main
    git checkout -b feature/v2-core-orchestration-isolation

    # Add PR1 files only
    git add templates/.claude/
    git add templates/ORCHESTRATION.md.template
    git add templates/CLAUDE.md.template

    git commit -m "feat: Add core orchestration system with context isolation

- Add slash command system (/do, /ux, /dev, /arch)
- Add context isolation enforcement (Architect via Task tool)
- Add 4 workflow tracks (A/B/C/D)
- Add fast-forward orchestration mode
- Update CLAUDE.md.template with orchestration
- Add ORCHESTRATION.md.template guide

Extracted from 6 months of DayFlow production usage.
Fully backward compatible with v1.0."

    git push -u origin feature/v2-core-orchestration-isolation

    gh pr create \
      --title "feat: Add core orchestration system with context isolation" \
      --body "See IMPLEMENTATION_GUIDE.md for details"

    echo "✅ PR #1 created!"
}

pr2() {
    echo "Creating PR #2: Memory Systems & Documentation"
    echo "-----------------------------------------------"

    git checkout main
    git pull origin main
    git checkout -b feature/v2-memory-state-tracking

    # Add PR2 files only
    git add templates/.planning/
    git add MIGRATION.md
    git add README.md

    git commit -m "feat: Add memory systems, state tracking, and documentation

- Add Architect Memory (pattern accumulation)
- Add cross-session state tracking
- Add feature planning templates
- Add complete migration guide (v1.0 → v2.0)
- Update README with v2.0 marketing

Completes v2.0 release with memory systems.
Fully backward compatible with v1.0."

    git push -u origin feature/v2-memory-state-tracking

    gh pr create \
      --title "feat: Add memory systems, state tracking, and documentation" \
      --body "See IMPLEMENTATION_GUIDE.md for details. Should merge after PR #1."

    echo "✅ PR #2 created!"
}

# ==============================================================================
# OPTION 2: SINGLE COMBINED PR
# ==============================================================================

combined() {
    echo "Creating Combined PR: Bootstrap v2.0"
    echo "------------------------------------"

    git checkout main
    git pull origin main
    git checkout -b feature/bootstrap-v2.0

    # Add all v2.0 files
    git add templates/.claude/
    git add templates/.planning/
    git add templates/ORCHESTRATION.md.template
    git add templates/CLAUDE.md.template
    git add MIGRATION.md
    git add README.md

    git commit -m "feat: Bootstrap v2.0 - Orchestration, memory, and state tracking

Complete Bootstrap v2.0 release with:
- Core orchestration system (slash commands, context isolation)
- Memory systems (Architect Memory, state tracking)
- Feature planning templates
- Complete documentation and migration guide

Changes:
- Add templates/.claude/ (8 files: 4 commands + 4 roles)
- Add templates/.planning/ (6 files: memory + planning templates)
- Add templates/ORCHESTRATION.md.template
- Update templates/CLAUDE.md.template
- Add MIGRATION.md
- Update README.md

Extracted from 6 months of DayFlow production usage.
100% backward compatible with v1.0."

    git push -u origin feature/bootstrap-v2.0

    gh pr create \
      --title "feat: Bootstrap v2.0 - Complete orchestration and memory systems" \
      --body "See IMPLEMENTATION_GUIDE.md for full details"

    echo "✅ Combined PR created!"
}

# ==============================================================================
# UTILITY FUNCTIONS
# ==============================================================================

verify() {
    echo "Verification Checks"
    echo "-------------------"
    echo ""
    echo ".claude files (should be 8):"
    find templates/.claude -type f | wc -l
    echo ""
    echo ".planning files (should be 6):"
    find templates/.planning -type f | wc -l
    echo ""
    echo "New files to be added:"
    git status --short | grep "^??"
}

tag_release() {
    echo "Tagging v2.0.0 Release"
    echo "----------------------"

    git checkout main
    git pull origin main
    git tag -a v2.0.0 -m "Bootstrap v2.0: Orchestration and Memory Systems"
    git push origin v2.0.0

    echo "✅ v2.0.0 tagged and pushed!"
}

# ==============================================================================
# HELP
# ==============================================================================

show_help() {
    echo ""
    echo "Usage:"
    echo "  source QUICK_COMMANDS.sh"
    echo ""
    echo "Then run:"
    echo "  verify          - Check files are in place"
    echo "  pr1             - Create PR #1 (orchestration)"
    echo "  pr2             - Create PR #2 (memory systems)"
    echo "  combined        - Create single combined PR"
    echo "  tag_release     - Tag v2.0.0 after merge"
    echo ""
}

# Show help by default
show_help
