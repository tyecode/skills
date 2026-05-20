---
name: react
description: React and Next.js best practices. Use when working with React code.
---

# Skill: react

## When to Use This Skill

Use this skill when:
- Working with React or Next.js
- Creating components
- Setting up React projects

## Component Structure

1. Imports (external first, then internal)
2. Types (if TypeScript)
3. Component
4. Hooks first
5. Effects
6. Event handlers
7. Render

## Performance Tips

- Use `useMemo` for expensive calculations
- Use `useCallback` for callbacks passed to children
- Lazy load with `React.lazy()`
- Keep component trees shallow

## State Management

| Scenario | Solution |
|----------|----------|
| Component-local | useState |
| Shared state | useContext or Zustand |
| Server data | TanStack Query |
| Form state | React Hook Form |