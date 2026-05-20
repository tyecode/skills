# Tyecode's Agent Skills

Personal skills for AI coding agents. Based on Karpathy-style guidelines.

## Quickstart

```bash
npx skills add tyecode/skills -g -y
```

## Skills Structure

### Base (Works on any project)
- **karpathy-guidelines** - Core coding behavior: think before coding, simplicity, surgical changes
- **grill-me** - Clarify requirements by interviewing the user
- **handoff** - Create handoff documents for another agent

### Frameworks
- **react** - React and Next.js best practices

### Languages
- **typescript** - TypeScript conventions and best practices

### Tools
- **tdd** - Test-driven development guidelines
- **deployment** - Deployment workflow guidelines

## Installation

### All Skills (Global)
```bash
npx skills add tyecode/skills -g -y
```

### Per Project - Choose What You Need

**Base (works on any project):**
```bash
npx skills add tyecode/skills@karpathy-guidelines
npx skills add tyecode/skills@grill-me
npx skills add tyecode/skills@handoff
```

**Framework-specific:**
```bash
npx skills add tyecode/skills@react
```

**Language-specific:**
```bash
npx skills add tyecode/skills@typescript
```

**Tools:**
```bash
npx skills add tyecode/skills@tdd
npx skills add tyecode/skills@deployment
```

## Also Supports

- **CLAUDE.md** - Copy to your project for Claude Code
- **Cursor** - Copy `.cursor/rules/karpathy-guidelines.mdc` to your project