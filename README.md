# Tyecode's Agent Skills

[![skills.sh](https://skills.sh/b/tyecode/skills)](https://skills.sh/tyecode/skills)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A collection of skills for AI coding agents. Each skill changes how the agent **behaves**, not just what it knows.

## What Are Skills?

Skills are instructions loaded into AI coding agents via the [skills.sh](https://skills.sh) platform. They work as slash commands — `/diagnose`, `/grill-me`, `/security` — that encode a specific behavior the agent follows when invoked: a debugging loop, a security checklist, a communication mode.

## Supported Agents

- **Claude Code** — primary target
- **Cursor** — via `.cursor/rules/`

## Quickstart

Install base skills — works on any project, any stack:

```bash
npx skills add tyecode/skills -s karpathy-guidelines,diagnose,zoom-out,tdd,git-workflow,security,grill-me,handoff,caveman -g -y
```

Install everything (base + stack):

```bash
npx skills add tyecode/skills -g -y
```

Install individual skills:

```bash
npx skills add tyecode/skills@diagnose
npx skills add tyecode/skills@react
npx skills add tyecode/skills@security
```

---

## Why These Skills Exist

Built to fix the most common failure modes I see with AI coding agents.

### #1: The Agent Doesn't Understand What You Want

**Problem**: You think the agent knows what you want. Then you see what they've built — and it's completely wrong.

**Fix**: `/grill-me` interviews you before coding. Asks one question at a time, provides recommended answers, and stops when requirements are fully resolved.

### #2: The Agent Codes Without Thinking

**Problem**: Agents jump straight to code without understanding the codebase, leading to wrong implementations and poor architecture.

**Fix**: `/karpathy-guidelines` enforces thinking before coding, simplicity first, and surgical changes only.

### #3: The Code Doesn't Work and You Can't Debug It

**Problem**: When bugs appear, agents spin in circles — changing random things, making it worse.

**Fix**: `/diagnose` runs a disciplined 6-phase loop: build feedback loop → reproduce → hypothesise → instrument → fix → regression test.

### #4: The Agent Ships Insecure Code

**Problem**: Agents commonly forget auth checks, skip input validation, expose stack traces, and miss rate limiting.

**Fix**: `/security` is a pre-ship checklist covering input validation, auth, API security, PII handling, and dependencies.

### #5: Hard to Transfer Work to Another Agent

**Problem**: When you hand off to another agent or start a new session, context is lost and the next agent starts from scratch.

**Fix**: `/handoff` compacts the current conversation into a clear document so another agent can continue seamlessly.

### #6: Token Waste on Familiar Code

**Problem**: Agents explain code in massive detail even when you already understand it.

**Fix**: `/caveman` switches to ultra-compressed communication (~75% less tokens) while keeping full technical accuracy.

---

## `engineering/` — Code Process Skills

Works on any codebase. Install these on every project:

| Skill | When to Invoke | What It Does |
|-------|---------------|--------------|
| **karpathy-guidelines** | When writing or reviewing code | Think before coding, simplicity first, surgical changes |
| **diagnose** | When debugging a hard bug | 6-phase diagnosis loop: reproduce → hypothesise → instrument → fix |
| **zoom-out** | When exploring unfamiliar code | Maps call chain and boundaries before making changes |
| **tdd** | When adding features or fixing bugs | Enforces failing test before any implementation |
| **git-workflow** | When committing or opening a PR | Conventional commits, branch rules, PR guidelines |
| **security** | Before marking any feature complete | Checklist: input validation, auth, rate limiting, secrets, PII |

---

## `productivity/` — Meta Skills

Domain-agnostic — useful for any knowledge work, not just coding:

| Skill | When to Invoke | What It Does |
|-------|---------------|--------------|
| **grill-me** | Before starting something new | Interviews you until requirements are fully resolved |
| **handoff** | When passing work to another agent | Compacts conversation into a handoff doc |
| **caveman** | When you want compressed responses | ~75% token reduction, no loss of technical accuracy |

---

## `frameworks/` — Framework Skills

Install based on your stack:

| Skill | When to Use |
|-------|-------------|
| **react** | React or Next.js projects |
| **nodejs** | Node.js backend projects |
| **electron** | Electron desktop apps |
| **setup-pre-commit** | Node.js projects needing Husky + lint-staged |

---

## `languages/` — Language Skills

| Skill | When to Use |
|-------|-------------|
| **typescript** | TypeScript projects |

---

## License

MIT — see [LICENSE](LICENSE)
