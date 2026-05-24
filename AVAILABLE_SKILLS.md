# Full Catalog of Skills

This repository contains two main categories of skills: Engineering skills (for code processes) and Productivity skills (for domain-agnostic agent workflows).

## `engineering/` — Code Process Skills

Works on any codebase. Install these on every project:

| Skill | When to Invoke | What It Does |
|-------|---------------|--------------|
| **karpathy-guidelines** | Always-on global install | Think before coding, simplicity first, surgical changes — applied automatically |
| **diagnose** | When debugging a hard bug | 6-phase diagnosis loop: reproduce → hypothesise → instrument → fix |
| **zoom-out** | When exploring unfamiliar code | Maps call chain and boundaries before making changes |
| **tdd** | When adding features or fixing bugs | Enforces failing test before any implementation |
| **git-workflow** | Always-on global install | Conventional commits, branch rules, and PR guidelines — applied automatically |
| **security** | Always-on global install | Checklist: input validation, auth, rate limiting, secrets, PII — applied automatically before shipping |
| **incident-commander** | When debugging a live production outage | Prioritizes mitigation over root cause, generates postmortem |
| **resilience** | Always-on global install | Enforces circuit breakers, fallbacks, and chaos hypotheses — applied automatically on external dependencies |
| **api-design** | When designing REST/GraphQL APIs | Enforces Stripe API pillars: consistency, idempotency, backwards compatibility |
| **changelog** | Before a release | Scans PRs, issues, and commits since last tag and writes clean, user-facing CHANGELOG entries |
| **release** | When cutting a release | Stamps CHANGELOG.md, bumps version, commits, tags, pushes, and publishes the GitHub Release |

## `productivity/` — Meta Skills

Domain-agnostic — useful for any knowledge work, not just coding:

| Skill | When to Invoke | What It Does |
|-------|---------------|--------------|
| **grill-me** | Before starting something new | Interviews you until requirements are fully resolved |
| **handoff** | When passing work to another agent | Compacts conversation into a handoff doc |
| **caveman** | When you want compressed responses | ~75% token reduction, no loss of technical accuracy |
| **working-backwards** | When proposing a new feature/product | Forces writing an Amazon PR/FAQ before coding |
| **write-a-skill** | When creating a new reusable skill | Teaches the agent the `skills.sh` file structure and constraints |
