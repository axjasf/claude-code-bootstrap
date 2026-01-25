# Claude Code Project Bootstrap Kit

A template kit for bootstrapping projects with Claude Code workflows.

## What v2.0 Adds

### Orchestrator System
An automated workflow coordinator that routes tasks through specialized roles:
- Classifies work into tracks (Full/Standard/Fast/Minimal) based on complexity
- Shows an execution graph at task start
- Auto-proceeds between steps, pausing only at human decision points
- Manages artifact handoff between roles

### Context Isolation
The Architect role is spawned as a separate agent without access to Dev's reasoning or planning context. This prevents self-review bias — the Architect sees only the code and specs, reviewing as an outsider would.

### Adversarial Review
The Architect operates with an adversarial mindset: assume bugs exist, find them. Reviews include mandatory checklists, auto-reject rules, and specific line-number feedback.

### Memory Accumulation
`ARCHITECT_MEMORY.md` grows over time with:
- Project-specific patterns to enforce
- Auto-reject rules for common mistakes
- Findings log from past reviews
- Code smell catalog

### Cross-Session State
`STATE.md` tracks active work, recent decisions, blockers, and handoff context so sessions can resume cleanly.

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
```

---

## What's Included

### Orchestration System (`.claude/`)

| File | Purpose |
|------|---------|
| `commands/do.md` | Main entry point — classifies and routes work |
| `commands/dev.md` | Direct Dev invocation |
| `commands/arch.md` | Direct Architect invocation (isolated) |
| `commands/ux.md` | Direct Product/UX Lead invocation |
| `roles/orchestrator.md` | Full orchestrator behavior and workflow tracks |
| `roles/dev.md` | Dev role definition |
| `roles/architect.md` | Architect role with review checklists |
| `roles/product-ux-lead.md` | Product/UX Lead role definition |

### Memory & State (`.planning/`)

| File | Purpose |
|------|---------|
| `ARCHITECT_MEMORY.md.template` | Accumulating review knowledge |
| `STATE.md.template` | Cross-session state tracking |
| `templates/*.md` | Feature planning templates |

### Core Templates

| File | Purpose |
|------|---------|
| `CLAUDE.md.template` | Entry point for AI collaboration |
| `ORCHESTRATION.md.template` | Orchestration system documentation |
| `DEVELOPMENT_STRATEGY.md.template` | Product roadmap structure |
| `ARCHITECTURE.md.template` | Technical architecture |

### Automation

| File | Purpose |
|------|---------|
| `scripts/setup-github-labels.sh` | Creates standardized GitHub labels |
| `scripts/pre-commit-check.sh` | Quality gate helper |

---

## Workflow Tracks

| Track | When | Steps |
|-------|------|-------|
| **A (Full)** | Features with UX changes | UX Discovery → Plan → Architect Review → Implement → UAT → Code Review → Merge |
| **B (Standard)** | Backend features, no UI | Plan → Architect Review → Implement → UAT → Code Review → Merge |
| **C (Fast)** | Simple bugs, refactors | Implement → Code Review → Merge |
| **D (Minimal)** | Typos, config, docs | Implement → Merge |

Human approval gates: Plan Approval, UAT, Merge (varies by track).

---

## v1.0 Compatibility

Manual role invocation still works. See `MIGRATION.md` for upgrade paths.

---

## License

MIT
