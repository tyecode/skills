---
name: react
description: React and Next.js best practices. Use when working with React code.
---

# Skill: react

## When to Use This Skill

Use this skill when:
- Building React components
- Managing state in a React app
- Working with Next.js

## State Management — Pick the Right Tool

| Situation | Use |
|-----------|-----|
| Local UI state (open/closed, input value) | `useState` |
| Derived value from existing state | Compute inline — no state at all |
| State shared across 2–3 nearby components | Lift to parent + props |
| State shared across many components | Zustand |
| Server data (fetching, caching, mutations) | TanStack Query |
| Form state with validation | React Hook Form |

Never reach for Context or Zustand for state that only one component needs.

## useEffect Rules

`useEffect` is for synchronizing with external systems (DOM APIs, subscriptions, timers). It is not a lifecycle hook.

**Do not use `useEffect` for:**
- Transforming data for rendering — compute it inline or use `useMemo`
- Updating state based on other state — compute it inline
- Fetching data on mount — use TanStack Query instead

If you find yourself writing `useEffect(() => { setState(...) }, [someProp])`, stop — there's almost always a better pattern.

## Performance

Only optimize when there's a measured problem. Premature memoization adds complexity for no gain.

- `useMemo` — expensive calculations that would rerun on every render
- `useCallback` — callbacks passed to memoized child components
- `React.lazy` + `Suspense` — code-split routes or heavy components

## Component Design

- One component, one responsibility. If a component needs a long comment to explain what it does, split it.
- Composition over prop drilling. If you're passing props more than 2 levels deep, use composition or Zustand.
- Keep components pure. Side effects belong in event handlers or `useEffect`, not in render.
