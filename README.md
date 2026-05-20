# Tyecode's Agent Skills

Personal skills for AI coding agents. Based on Karpathy-style guidelines.

## Quickstart

```bash
npx skills add tyecode/skills
```

## Skills

- **karpathy-guidelines** - Think before coding, simplicity first, surgical changes, goal-driven execution
- **grill-me** - Clarify requirements by interviewing the user
- **handoff** - Create handoff documents for another agent

## Principles

1. **Think Before Coding** - Don't assume, ask questions
2. **Simplicity First** - Minimum code, no speculative features
3. **Surgical Changes** - Touch only what's needed
4. **Goal-Driven** - Define success criteria, verify with tests

## Installation

### Per Project
```bash
npx skills add tyecode/skills@karpathy-guidelines
npx skills add tyecode/skills@grill-me
npx skills add tyecode/skills@handoff
```

### Global
```bash
npx skills add tyecode/skills -g -y
```

## Also Supports

- **CLAUDE.md** - Copy to your project for Claude Code
- **Cursor** - Copy `.cursor/rules/karpathy-guidelines.mdc` to your project