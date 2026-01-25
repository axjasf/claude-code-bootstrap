# Migrating from v1.0 to v2.0

This guide helps you upgrade from the v1.0 bootstrap (manual handoffs) to v2.0 (orchestration with context isolation).

---

## What's Changed

### High-Level Summary

| Aspect | v1.0 | v2.0 |
|--------|------|------|
| **Workflow** | Manual role invocation | Automated orchestration via `/do` |
| **Architect Context** | Same session (sees Dev reasoning) | Isolated agent (independent review) |
| **Role Count** | 5 roles (Dev, TestEng, BuildEng, Arch, ReqsEng) | 4 roles (Dev, Architect, Product/UX Lead, PM optional) |
| **Memory** | None | ARCHITECT_MEMORY.md accumulates patterns |
| **State Tracking** | DEVELOPMENT_STRATEGY.md only | .planning/STATE.md + feature dirs |
| **UAT** | No formal UAT step | Required before Architect review |
| **Workflow Tracks** | Single workflow | 4 tracks (A/B/C/D) by complexity |

### Backward Compatibility

✅ **v1.0 workflows still work** - Manual handoffs are supported
✅ **Incremental adoption** - Use orchestration for some tasks, manual for others
✅ **No breaking changes** - Existing CLAUDE.md sections remain valid

---

## Migration Path

### Option 1: Full Migration (Recommended)

Adopt all v2.0 features for maximum value.

**Steps:**
1. [Add new directory structures](#step-1-add-directory-structures)
2. [Copy templates](#step-2-copy-templates)
3. [Update CLAUDE.md](#step-3-update-claudemd)
4. [Initialize memory system](#step-4-initialize-memory-system)
5. [Train team](#step-5-train-team)

**Time:** 2-3 hours
**Benefit:** Full orchestration, memory accumulation, independent reviews

---

### Option 2: Minimal Migration

Add only context isolation (biggest value, minimal change).

**Steps:**
1. Add "Context Isolation" section to CLAUDE.md ([see template](#minimal-context-isolation))
2. Update Architect role definition to require Task tool spawning
3. Keep everything else from v1.0

**Time:** 30 minutes
**Benefit:** Independent Architect reviews (catches more bugs)

---

### Option 3: Gradual Migration

Adopt features over time as you see fit.

**Week 1:** Context isolation
**Week 2:** Add `.claude/` directory, try `/do` command
**Week 3:** Add memory system
**Week 4:** Full adoption with UAT integration

---

## Step-by-Step: Full Migration

### Step 1: Add Directory Structures

```bash
mkdir -p .claude/commands .claude/roles .planning/templates
```

**What this enables:** Slash commands and orchestration system

---

### Step 2: Copy Templates

#### From `templates/.claude/commands/`:
```bash
cp templates/.claude/commands/do.md .claude/commands/
cp templates/.claude/commands/dev.md .claude/commands/
cp templates/.claude/commands/arch.md .claude/commands/
cp templates/.claude/commands/ux.md .claude/commands/
```

#### From `templates/.claude/roles/`:
```bash
cp templates/.claude/roles/orchestrator.md .claude/roles/
cp templates/.claude/roles/dev.md .claude/roles/
cp templates/.claude/roles/architect.md .claude/roles/
cp templates/.claude/roles/product-ux-lead.md .claude/roles/
```

#### From `templates/.planning/`:
```bash
cp templates/.planning/ARCHITECT_MEMORY.md.template .planning/ARCHITECT_MEMORY.md
cp templates/.planning/STATE.md.template .planning/STATE.md
cp -r templates/.planning/templates/ .planning/
```

#### Root documentation:
```bash
cp templates/ORCHESTRATION.md.template ORCHESTRATION.md
```

**Replace placeholders:**
```bash
# Replace {{PROJECT_NAME}} with your project name
# Replace {{EXT}} with your file extension (py, js, ts, etc.)
# Replace other {{PLACEHOLDERS}} as needed
```

---

### Step 3: Update CLAUDE.md

#### Add New Sections

**After "Before You Do Anything", add:**

```markdown
## Orchestration System (Recommended)

For coordinated multi-role work, use the orchestration system:

\`\`\`
/do [task description]     # Orchestrator routes through roles automatically
/ux [feature description]  # Product/UX Lead for discovery & specs
/dev [task description]    # Dev for implementation & tests
/arch [PR to review]       # Architect for independent review
\`\`\`

**See `ORCHESTRATION.md` for full documentation.**

**Key principles:**
- Product/UX Lead and Dev share context. Architect is **isolated** (reviews independently without Dev's reasoning).
- **Fast-forward mode** (default): Orchestrator auto-proceeds, pausing only at UX Discovery, Plan Approval, UAT, and Merge Approval.

**Files:**
- `.claude/commands/` — Slash command entry points
- `.claude/roles/` — Full role definitions
```

**Before "Role Handoff Protocol", add:**

```markdown
## Context Isolation (CRITICAL)

**The Architect MUST review independently, without seeing Dev's reasoning.**

### Wrong Approach (Self-Review)
\`\`\`
[Dev implements in Session 1]
[Same Claude session switches to Architect role]
[Architect reviews own work] ← USELESS (sees all Dev reasoning)
\`\`\`

### Correct Approach (Independent Review)
\`\`\`
[Dev implements in Session 1]
[Spawn NEW isolated agent for Architect via Task tool]
[Architect reviews without Session 1 context] ← VALUABLE
\`\`\`

### How to Enforce

When it's time for Architect review, use the **Task tool**:

\`\`\`
Description: "Architect review PR #X"
Subagent: "general-purpose"
Prompt: |
  You are Chief Architect for {{PROJECT_NAME}}.

  1. Read .claude/roles/architect.md for full review instructions
  2. Read ARCHITECTURE.md for technical context
  3. Review PR #X independently

  CRITICAL: You have NO context from Dev's planning or reasoning.
  Review as if a stranger wrote this code.
\`\`\`

**Never "act as Architect" in the same session where Dev worked.**

**Why this matters:**
- Dev is biased toward their own code
- Architect catches what Dev missed
- Fresh eyes find hidden assumptions
- This is the #1 value of the role system
```

#### Update Role Definitions Section

Replace old role definitions with:

```markdown
### Role Definitions

> **Full role definitions:** See `.claude/roles/*.md` for complete instructions.
> **Invoke via:** `/do`, `/ux`, `/dev`, `/arch` commands.

**Product/UX Lead** (formerly ReqsEng + UX):
- Conducts discovery (interviews human)
- Defines requirements with testable acceptance criteria
- Creates interaction design (wireframes when needed)
- Conducts UAT (User Acceptance Testing) before Architect review
- Full definition: `.claude/roles/product-ux-lead.md`

**Staff Developer**:
- Plans implementation (for non-trivial work)
- Writes code + tests (tests are mandatory)
- Commits frequently, pushes after each commit
- Hands off to Architect for review
- Full definition: `.claude/roles/dev.md`

**Chief Architect**:
- Reviews plans (before coding starts)
- Reviews code (after implementation)
- **MUST be isolated** (spawned via Task tool, no Dev context)
- Uses adversarial mindset (assume bugs exist)
- Returns verdict: APPROVE / REJECT / NEED INFO
- Full definition: `.claude/roles/architect.md`

**Note:** TestEng and BuildEng are now absorbed into Architect's review checklist (tests and CI are BLOCKING criteria).
```

#### Update Key Documents Table

Add these rows:

```markdown
| `ORCHESTRATION.md` | **Orchestration system**. Workflows, context isolation, roles. | When using `/do` or role commands |
| `.claude/roles/*.md` | **Full role definitions**. Detailed instructions per role. | When acting as a specific role |
```

---

### Step 4: Initialize Memory System

Edit `.planning/ARCHITECT_MEMORY.md`:

1. Replace `{{PROJECT_NAME}}` with your project name
2. Add 2-3 initial project-specific patterns
3. Add 2-3 initial auto-reject rules
4. Document any existing code smells

**Example initial patterns:**

```markdown
### Authentication
- **RULE:** All API calls must include authentication token
- **Auto-reject:** Direct API calls without auth check
- **Why:** Prevents unauthorized access

### Error Handling
- **RULE:** User-facing errors must show actionable messages
- **Auto-reject:** Generic "An error occurred" messages
- **Why:** Users need to know what went wrong and how to fix it
```

---

### Step 5: Train Team

**For human developers:**
1. Read `ORCHESTRATION.md` - understand the workflow
2. Try `/do` command for one task - see how it feels
3. Review sample session in ORCHESTRATION.md

**For AI agents:**
- Just use `/do` - the Orchestrator knows what to do

---

## Minimal Context Isolation

If you only want to add context isolation (Option 2), add this section to CLAUDE.md:

```markdown
## Context Isolation (CRITICAL)

**The Architect MUST review independently, without seeing Dev's reasoning.**

When it's time for Architect review, use the **Task tool** to spawn an isolated agent:

\`\`\`
Description: "Architect review PR #X"
Subagent: "general-purpose"
Prompt: |
  You are Chief Architect for {{PROJECT_NAME}}.

  1. Read .claude/roles/architect.md for full review instructions
  2. Read ARCHITECTURE.md for technical context
  3. Review PR #X independently

  CRITICAL: You have NO context from Dev's planning or reasoning.
  Review as if a stranger wrote this code.
\`\`\`

**Never "act as Architect" in the same session where Dev worked.**
```

---

## Troubleshooting

### "Orchestrator doesn't pause when I expect"

Check `.claude/roles/orchestrator.md` pause points. Only these are mandatory:
- UX Discovery (Track A only)
- Plan Approval (Track A/B)
- UAT (Track A/B)
- Merge Approval (all tracks)

Other steps auto-proceed.

### "Architect is rejecting too many PRs"

**This is working as intended.** Architect is supposed to be strict. Fix the issues and resubmit.

If you want less strict reviews, adjust `.claude/roles/architect.md` checklist. But we recommend keeping it strict.

### "Context isolation isn't working"

Verify:
1. Architect is spawned via Task tool (not "Now acting as Architect...")
2. Prompt only includes PR number and file paths (not Dev reasoning)
3. Architect agent is fresh (not resumed from Dev session)

### "I prefer the old 5-role system"

Keep it! v2.0 is backward compatible. You can:
- Keep TestEng and BuildEng as separate roles
- Skip Product/UX Lead merge
- Just add context isolation for Architect

The orchestration system is flexible.

---

## Rollback

If v2.0 isn't working for you:

1. Keep using manual handoffs (still supported)
2. Remove `.claude/` directory
3. Remove orchestration sections from CLAUDE.md
4. Keep using v1.0 workflow

No harm done. You can try again later.

---

## FAQ

**Q: Do I have to use `/do` for everything?**
A: No. Use it when you want automated workflow. Manual invocation still works.

**Q: Can I customize the workflow tracks?**
A: Yes. Edit `.claude/roles/orchestrator.md` to adjust tracks, pause points, and sequences.

**Q: What if I don't want UAT?**
A: Edit orchestrator.md to remove UAT from Track B. It's optional for Track C/D already.

**Q: Can I add my own roles?**
A: Yes. Create `.claude/roles/my-role.md` and update orchestrator.md workflow.

**Q: Is the memory system required?**
A: No, but highly recommended. Architect gets smarter over time. Without it, you repeat the same reviews.

**Q: How do I migrate mid-sprint?**
A: Finish current work with v1.0, start next feature with v2.0. No need to switch mid-task.

---

## Summary

**Minimal viable upgrade:** Add context isolation section to CLAUDE.md (30 min)
**Recommended upgrade:** Full migration with orchestration + memory (2-3 hours)
**Key benefit:** Independent Architect reviews catch more bugs
**Backward compatible:** v1.0 workflows still work

**Questions?** See `ORCHESTRATION.md` for full documentation.
