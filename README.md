# Tyecode's Agent Skills

[![skills.sh](https://skills.sh/b/tyecode/skills)](https://skills.sh/tyecode/skills)

Personal skills for AI coding agents. Based on Karpathy-style guidelines.

These skills help agents code better: think before coding, verify before committing, debug systematically, and communicate precisely.

## Quickstart

Install all base skills (works on ANY project):

```bash
npx skills add tyecode/skills -g -y
```

Or install individual skills:

```bash
npx skills add tyecode/skills@karpathy-guidelines
npx skills add tyecode/skills@grill-me
npx skills add tyecode/skills@diagnose
```

---

## Why These Skills Exist

I built these skills to fix common failure modes I see with AI coding agents.

### #1: The Agent Doesn't Understand What You Want

**The Problem**: You think the agent knows what you want. Then you see what they've built - and it's completely wrong.

**The Fix**: Use `/grill-me` to interview you before coding. Clarifies requirements by asking detailed questions until every branch of the decision tree is resolved.

### #2: The Agent Codes Without Thinking

**The Problem**: Agents often jump straight to code without understanding the codebase, leading to incorrect implementations or poor architectural decisions.

**The Fix**: Use `/karpathy-guidelines` - core coding behavior that emphasizes thinking before coding, simplicity, and surgical changes.

### #3: The Code Doesn't Work and You Can't Debug It

**The Problem**: When bugs appear, agents spin in circles without making progress.

**The Fix**: Use `/diagnose` - disciplined diagnosis loop: reproduce → minimise → hypothesise → instrument → fix → regression-test.

### #4: Hard to Transfer Work to Another Agent

**The Problem**: When you hand off to another agent (or after a session ends), context is lost and the next agent starts from scratch.

**The Fix**: Use `/handoff` to compact the current conversation into a clear document so another agent can continue seamlessly.

### #5: Token Waste on Familiar Code

**The Problem**: Agents explain code in massive detail even when you already understand it.

**The Fix**: Use `/caveman` for ultra-compressed communication (~75% less tokens) while keeping full technical accuracy.

---

## `engineering/` — Code Process Skills

Works on any codebase. Install these for better coding habits:

| Skill | Purpose |
|-------|---------|
| **karpathy-guidelines** | Think before coding, simplicity, surgical changes |
| **diagnose** | Debug hard bugs: reproduce → hypothesise → instrument → fix |
| **zoom-out** | Get context when exploring unfamiliar code |
| **tdd** | Test-driven development: red → green → refactor |
| **git-workflow** | Commit conventions, branch naming, code review |

---

## `productivity/` — Meta Skills

Domain-agnostic. Work for any knowledge work, not just coding:

| Skill | Purpose |
|-------|---------|
| **grill-me** | Clarify requirements by interviewing the user |
| **handoff** | Compact current work into a doc for another agent |
| **caveman** | Ultra-compressed mode (~75% less tokens) |

---

## `frameworks/` — Framework Skills

| Skill | When to Use |
|-------|-------------|
| **react** | React or Next.js projects |
| **nodejs** | Node.js backend projects |
| **electron** | Electron desktop apps |
| **setup-pre-commit** | Node.js projects (Husky + lint-staged) |

---

## `languages/` — Language Skills

| Skill | When to Use |
|-------|-------------|
| **typescript** | TypeScript projects |

---

## Also Supports

- **CLAUDE.md** - Copy to your project for Claude Code
- **Cursor** - Copy `.cursor/rules/karpathy-guidelines.mdc` to your project