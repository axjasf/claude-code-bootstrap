# Claude Code Project Bootstrap Kit

**v2.0 - The AI Code Review System That Actually Catches Bugs**

Stop having AI review its own work. v2.0 introduces **context isolation** — your Architect reviews code independently, without seeing Dev's reasoning. Plus **memory accumulation** means the system learns your project's patterns and catches more bugs over time.

### The Problem with Standard AI Code Review

When the same AI agent writes code and reviews it, you get rubber-stamp approvals. The agent sees all its own reasoning, assumptions, and shortcuts. It can't catch what it doesn't know it missed.

### v2.0 Solves This

- **Independent Reviews** — Architect spawned in isolated context, reviews as a stranger would
- **Automated Orchestration** — `/do` command routes work through roles, humans focus on decisions
- **Learning System** — Memory accumulates anti-patterns, auto-reject rules, common code smells
- **Right-Sized Review** — Complex features get full scrutiny, trivial fixes get fast paths

---

## Quick Start

```bash
# 1. Clone this repository
git clone https://github.com/axjasf/claude-code-bootstrap.git
cd your-new-project

# 2. Copy core templates
cp templates/CLAUDE.md.template CLAUDE.md
cp templates/DEVELOPMENT_STRATEGY.md.template DEVELOPMENT_STRATEGY.md
cp templates/ARCHITECTURE.md.template ARCHITECTURE.md

# 3. Copy v2.0 orchestration system
cp -r templates/.claude .claude
cp -r templates/.planning .planning
cp templates/ORCHESTRATION.md.template ORCHESTRATION.md

# 4. Set up GitHub labels
./scripts/setup-github-labels.sh

# 5. Replace {{PLACEHOLDERS}} with your project-specific content
# 6. Commit and start using /do
```

---

## What's Included

### v2.0 Orchestration System

| File | Purpose |
|------|---------|
| `.claude/commands/do.md` | Main orchestrator - routes work through roles |
| `.claude/commands/dev.md` | Direct Dev invocation |
| `.claude/commands/arch.md` | Direct Architect invocation (isolated) |
| `.claude/commands/ux.md` | Direct Product/UX Lead invocation |
| `.claude/roles/*.md` | Full role definitions with checklists |

### v2.0 Memory & State

| File | Purpose |
|------|---------|
| `.planning/ARCHITECT_MEMORY.md.template` | Accumulates patterns, auto-reject rules |
| `.planning/STATE.md.template` | Cross-session state tracking |
| `.planning/templates/*.md` | Feature planning templates |

### Core Templates

| File | Purpose |
|------|---------|
| `CLAUDE.md.template` | AI collaboration workflow entry point |
| `ORCHESTRATION.md.template` | Full orchestration documentation |
| `DEVELOPMENT_STRATEGY.md.template` | Product roadmap with phases |
| `ARCHITECTURE.md.template` | Technical architecture |

### Automation

| File | Purpose |
|------|---------|
| `scripts/setup-github-labels.sh` | Creates standardized GitHub labels |
| `scripts/pre-commit-check.sh` | Quality gate helper |
| `templates/.github/workflows/ci-macos-swift.yml` | CI workflow for Swift/macOS |

---

## What Changed in v2.0

| Aspect | v1.0 | v2.0 |
|--------|------|------|
| **Workflow** | Manual role invocation | Automated via `/do` command |
| **Architect** | Same session (sees Dev reasoning) | Isolated agent (independent review) |
| **Memory** | None | Patterns accumulate over time |
| **State** | DEVELOPMENT_STRATEGY.md only | .planning/STATE.md + feature dirs |

**Backward compatible** — v1.0 manual workflows still work. See `MIGRATION.md` for upgrade paths.

---

## License

MIT License - Use freely in your projects.
