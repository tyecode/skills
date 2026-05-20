---
name: deployment
description: Deployment workflow guidelines. Use when deploying applications.
---

# Skill: deployment

## When to Use This Skill

Use this skill when:
- Deploying to production
- Setting up CI/CD
- Configuring hosting

## Platforms

| Platform | Best For |
|----------|----------|
| Vercel | Next.js, React |
| Netlify | Static sites |
| Railway | Full-stack Node.js |
| Docker | Self-hosted |

## Vercel

```bash
vercel            # Dev
vercel --prod     # Production
```

## Pre-deploy Checklist

- [ ] Tests pass locally
- [ ] Build succeeds
- [ ] Env vars configured
- [ ] Health check ready