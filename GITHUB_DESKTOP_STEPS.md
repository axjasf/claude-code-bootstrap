# GitHub Desktop Instructions

## Super Simple Steps

### PR #1: Core Orchestration System

1. **Open GitHub Desktop**
2. **Switch to your repo** (claude-code-bootstrap)
3. **Create new branch**:
   - Current branch dropdown → New Branch
   - Name: `feature/v2-core-orchestration-isolation`
   - Create from: `main`
4. **Select files to commit**:
   - Check: `templates/.claude/` (all 8 files)
   - Check: `templates/ORCHESTRATION.md.template`
   - Check: `templates/CLAUDE.md.template`
   - Uncheck everything else
5. **Write commit message**:
   - Summary: `feat: Add core orchestration system with context isolation`
   - Description:
     ```
     - Add slash command system (/do, /ux, /dev, /arch)
     - Add context isolation enforcement (Architect via Task tool)
     - Add 4 workflow tracks (A/B/C/D)
     - Add fast-forward orchestration mode
     - Update CLAUDE.md.template with orchestration
     - Add ORCHESTRATION.md.template guide

     Extracted from 6 months of DayFlow production usage.
     Fully backward compatible with v1.0.
     ```
6. **Commit to feature/v2-core-orchestration-isolation**
7. **Push** (Publish branch button)
8. **Create Pull Request** (Click the "Create Pull Request" button or go to GitHub.com)

---

### PR #2: Memory Systems & Documentation

1. **Switch back to main branch** in GitHub Desktop
2. **Create new branch**:
   - Name: `feature/v2-memory-state-tracking`
   - Create from: `main`
3. **Select files to commit**:
   - Check: `templates/.planning/` (all 6 files)
   - Check: `MIGRATION.md`
   - Check: `README.md`
   - Uncheck everything else
4. **Write commit message**:
   - Summary: `feat: Add memory systems, state tracking, and documentation`
   - Description:
     ```
     - Add Architect Memory (pattern accumulation)
     - Add cross-session state tracking
     - Add feature planning templates
     - Add complete migration guide (v1.0 → v2.0)
     - Update README with v2.0 marketing

     Completes v2.0 release with memory systems.
     Fully backward compatible with v1.0.
     ```
5. **Commit to feature/v2-memory-state-tracking**
6. **Push** (Publish branch button)
7. **Create Pull Request**

---

## OR: Single Combined PR (Faster)

If you want just ONE PR:

1. **Open GitHub Desktop**
2. **Create new branch**:
   - Name: `feature/bootstrap-v2.0`
   - Create from: `main`
3. **Select ALL v2.0 files**:
   - ✅ `templates/.claude/` (all files)
   - ✅ `templates/.planning/` (all files)
   - ✅ `templates/ORCHESTRATION.md.template`
   - ✅ `templates/CLAUDE.md.template`
   - ✅ `MIGRATION.md`
   - ✅ `README.md`
   - ❌ Uncheck helper files: `IMPLEMENTATION_GUIDE.md`, `QUICK_COMMANDS.sh`, `RUN_THIS.md`, `GITHUB_DESKTOP_STEPS.md`
4. **Write commit message**:
   - Summary: `feat: Bootstrap v2.0 - Orchestration, memory, and state tracking`
   - Description:
     ```
     Complete Bootstrap v2.0 release with orchestration and memory systems.

     - Add templates/.claude/ (8 files: 4 commands + 4 roles)
     - Add templates/.planning/ (6 files: memory + planning templates)
     - Add templates/ORCHESTRATION.md.template
     - Update templates/CLAUDE.md.template
     - Add MIGRATION.md
     - Update README.md

     Extracted from 6 months of DayFlow production usage.
     100% backward compatible with v1.0.
     ```
5. **Commit**
6. **Push** (Publish branch)
7. **Create Pull Request**

---

## Visual Guide

Your GitHub Desktop should show these files as new/modified:

```
New files:
✅ templates/.claude/commands/arch.md
✅ templates/.claude/commands/dev.md
✅ templates/.claude/commands/do.md
✅ templates/.claude/commands/ux.md
✅ templates/.claude/roles/architect.md
✅ templates/.claude/roles/dev.md
✅ templates/.claude/roles/orchestrator.md
✅ templates/.claude/roles/product-ux-lead.md
✅ templates/.planning/ARCHITECT_MEMORY.md.template
✅ templates/.planning/STATE.md.template
✅ templates/.planning/templates/CONTEXT.md.template
✅ templates/.planning/templates/IMPLEMENTATION_PLAN.md.template
✅ templates/.planning/templates/REQUIREMENTS.md.template
✅ templates/.planning/templates/VERIFICATION.md.template
✅ templates/ORCHESTRATION.md.template
✅ MIGRATION.md

Modified files:
📝 templates/CLAUDE.md.template
📝 README.md

Helper files (don't commit these):
❌ IMPLEMENTATION_GUIDE.md
❌ QUICK_COMMANDS.sh
❌ RUN_THIS.md
❌ GITHUB_DESKTOP_STEPS.md
❌ BOOTSTRAP_V2_COMPLETE.md
```

---

## Tips

- **Don't commit the helper files** (IMPLEMENTATION_GUIDE.md, etc.) - those are just for you
- **Make sure you're on the right branch** before committing
- **Use the checkboxes** in GitHub Desktop to select exactly which files to include
- **Push immediately** after committing to create the remote branch

That's it! Super simple with GitHub Desktop. 🎉
