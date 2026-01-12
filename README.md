# Claude Code Project Bootstrap Kit

A template kit for bootstrapping new projects with Claude Code workflows, CI/CD pipelines, and GitHub Issues integration.

---

## Quick Start

```bash
# 1. Clone or copy this repository
git clone https://github.com/YOUR_ORG/claude-code-bootstrap.git
cd your-new-project

# 2. Run the label setup script
./scripts/setup-github-labels.sh

# 3. Copy templates to your project
cp templates/CLAUDE.md.template CLAUDE.md
cp templates/DEVELOPMENT_STRATEGY.md.template DEVELOPMENT_STRATEGY.md
cp templates/ARCHITECTURE.md.template ARCHITECTURE.md
cp templates/UX_GUIDE.md.template UX_GUIDE.md
cp templates/CONCEPTUAL_MODEL.md.template CONCEPTUAL_MODEL.md

# For Swift/macOS projects:
cp templates/.swiftlint.yml .swiftlint.yml
mkdir -p .github/workflows
cp templates/.github/workflows/ci-macos-swift.yml .github/workflows/ci.yml

# 4. Replace {{PLACEHOLDERS}} with your project-specific content
# 5. Commit and push
```

---

## What's Included

### Core Files

| File | Purpose |
|------|---------|
| `CLAUDE.md.template` | AI collaboration workflow with role handoff protocol |
| `DEVELOPMENT_STRATEGY.md.template` | Product roadmap with phases, tasks, decisions log |
| `ARCHITECTURE.md.template` | Technical architecture for humans and AI |
| `UX_GUIDE.md.template` | Visual and interaction design guidelines |
| `CONCEPTUAL_MODEL.md.template` | Domain mental model and concepts |

### Automation

| File | Purpose |
|------|---------|
| `scripts/setup-github-labels.sh` | Creates standardized GitHub labels |
| `scripts/pre-commit-check.sh` | Quality gate helper (lint, test, debug check) |
| `templates/.github/workflows/ci-macos-swift.yml` | CI workflow for Swift/macOS projects |
| `templates/.swiftlint.yml` | Swift linting configuration |

---

## Key Features

### Role Handoff Protocol

A proven 4-role workflow for AI-assisted development:

```
┌─────────┐    ┌──────────┐    ┌──────────┐    ┌────────────────────┐
│  Dev    │───▶│ TestEng  │───▶│ BuildEng │───▶│    Architect       │
│         │    │          │    │          │    │  (E2E + Logic)     │
└─────────┘    └──────────┘    └──────────┘    └────────────────────┘
     ▲              │                │                   │
     └──────────────┴────────────────┴───────────────────┘
                    "Needs changes" → back to Dev
```

Each role has:
- Clear responsibilities
- Handoff prompts
- Approval gates

### GitHub Issues Integration

Standardized label taxonomy:

| Category | Labels |
|----------|--------|
| **Priority** | P0 (Critical), P1 (High), P2 (Medium), P3 (Low) |
| **Type** | bug, enhancement, tech-debt, ux, refactor |
| **Status** | triage, in-progress, blocked |
| **Phase** | phase-1, phase-2, phase-3 |

### Human Approval Gates

The workflow ensures humans stay in control:

**Requires approval:**
- Merging PRs
- Deleting branches
- Manually closing issues
- Creating labeled issues

**AI can do freely:**
- Create triage issues
- Add labels to existing issues
- View and comment

### Git Branching Strategy

Documented workflows for both:
- **Claude agents** - Session rules, handoff protocol
- **Human developers** - Branch types, naming conventions, commit format

### Plan Mode & Quality Gates

- **Plan mode workflow** - Use `/plan` for non-trivial implementations
- **Pre-commit quality gates** - Verify build, tests, lint before committing
- **YAGNI principle** - Implement only what's requested

---

## Customization Guide

### CLAUDE.md Placeholders

| Placeholder | Replace With |
|-------------|--------------|
| `{{PROJECT_NAME}}` | Your project name |
| `{{PROJECT_TYPE}}` | App type (e.g., "macOS app", "web service") |
| `{{PROJECT_DESCRIPTION}}` | One-line description |
| `{{BUILD_COMMAND}}` | Your build command |
| `{{TEST_COMMAND}}` | Your test command |
| `{{LINT_COMMAND}}` | Your lint command |
| `{{UI_FRAMEWORK}}` | SwiftUI, React, Vue, etc. |
| `{{DATA_LAYER}}` | SwiftData, PostgreSQL, etc. |
| `{{ARCHITECTURE_PATTERN}}` | MVVM, MVC, etc. |

### CI Workflow Variables

For Swift/macOS projects, set in GitHub repository settings:

| Variable | Purpose | Default |
|----------|---------|---------|
| `PROJECT_NAME` | .xcodeproj name (no extension) | MyProject |
| `SCHEME_NAME` | Xcode scheme | PROJECT_NAME |
| `BUILD_DESTINATION` | Target platform | platform=macOS |
| `XCODE_VERSION` | Xcode version | Xcode_16.2.app |

### SwiftLint Thresholds

Adjust in `.swiftlint.yml` based on codebase maturity:

| Scenario | function_body_length | file_length |
|----------|---------------------|-------------|
| New project | 40 / 60 | 300 / 500 |
| Active development | 60 / 100 | 500 / 1000 |
| Legacy codebase | 100 / 150 | 1000 / 1500 |

---

## Philosophy

This kit embodies these principles:

1. **Human approval gates** - AI suggests, human approves
2. **Role specialization** - Different perspectives improve quality
3. **Soft linting** - Warnings don't block; errors do
4. **Issue-driven work** - Everything tracked in GitHub Issues
5. **Progressive documentation** - Start minimal, grow as needed
6. **One branch at a time** - Prevent duplicate/conflicting work

---

## File Structure

```
claude-code-bootstrap/
├── README.md                              # This file
├── scripts/
│   ├── setup-github-labels.sh             # Label creation automation
│   └── pre-commit-check.sh                # Quality gate helper
└── templates/
    ├── CLAUDE.md.template                 # AI collaboration workflow
    ├── DEVELOPMENT_STRATEGY.md.template   # Product roadmap structure
    ├── ARCHITECTURE.md.template           # Technical architecture
    ├── UX_GUIDE.md.template               # Design/interaction guide
    ├── CONCEPTUAL_MODEL.md.template       # Domain mental model
    ├── .github/
    │   └── workflows/
    │       └── ci-macos-swift.yml         # CI workflow
    └── .swiftlint.yml                     # Linting configuration
```

---

## Extracted From

This kit was extracted from the [DayFlow](https://github.com/YOUR_ORG/DayFlow) project, where these patterns were developed and refined over multiple phases of development.

---

## License

MIT License - Use freely in your projects.

---

*Bootstrap your projects with proven Claude Code workflows.*
