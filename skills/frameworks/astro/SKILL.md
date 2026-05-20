---
name: astro
description: Astro best practices and conventions. Use when working with Astro projects.
---

# Skill: astro

## When to Use This Skill

Use this skill when:
- Building or modifying an Astro project
- Deciding whether to add JavaScript to a component
- Working with content collections

## The Default: No JavaScript

Astro ships zero JavaScript by default. That is the goal, not a limitation. Only add JavaScript when a component genuinely requires interactivity that cannot be done with CSS.

When you add a `client:*` directive, you are making a deliberate tradeoff — more interactivity, more bundle weight. Be intentional.

## Hydration Directives — When to Use Each

| Directive | Use when |
|-----------|----------|
| `client:load` | Component must be interactive immediately on page load |
| `client:idle` | Component can wait until the browser is idle |
| `client:visible` | Component only needs to hydrate when scrolled into view |
| `client:only` | Component has no server-rendered output (e.g. canvas, maps) |

When in doubt, `client:visible` is safer than `client:load` — it defers work until needed.

## Content Collections

Use content collections for any structured content: blog posts, docs, product listings. Do not manage structured content as loose files without a collection schema.

Define schemas with Zod in `src/content/config.ts`:

```typescript
import { defineCollection, z } from 'astro:content';

const blog = defineCollection({
  schema: z.object({
    title: z.string(),
    date: z.date(),
    draft: z.boolean().default(false),
  }),
});

export const collections = { blog };
```

## Component vs Page

- Pages go in `src/pages/` — every file becomes a route
- Reusable UI goes in `src/components/`
- Use layouts (`src/layouts/`) for shared page structure — not a component

## Integrations

Add integrations only when needed. Each one adds build complexity.

| Need | Integration |
|------|-------------|
| React/Vue/Svelte components | `@astrojs/react` etc. |
| Tailwind CSS | `@astrojs/tailwind` |
| SEO sitemap | `@astrojs/sitemap` |
| MDX support | `@astrojs/mdx` |
