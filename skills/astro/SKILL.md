---
name: astro
description: Astro best practices and conventions. Use when working with Astro projects.
---

# Skill: astro

## When to Use This Skill

Use this skill when:
- Working with Astro projects
- Building static sites with Astro
- Creating content-focused websites

## Project Structure

```
src/
├── components/
├── layouts/
├── pages/
│   └── index.astro
├── content/
│   └── config.ts
└── styles/
```

## Best Practices

- Use `.astro` files for static pages
- Use components for reusable UI
- Use layouts for page wrappers
- Use content collections for blog/docs

## Key Features

- Zero JS by default
- Island architecture
- Content collections
- View Transitions API

## Common Patterns

**Component:**
```astro
---
const { title } = Astro.props;
---
<h1>{title}</h1>
<slot />
```

**Layout:**
```astro
---
import BaseHead from '../components/BaseHead.astro';
---
<html>
  <BaseHead />
  <body>
    <slot />
  </body>
</html>
```

## Integrations

- `@astrojs/react` - React support
- `@astrojs/tailwind` - Tailwind CSS
- `@astrojs/sitemap` - Sitemap generation