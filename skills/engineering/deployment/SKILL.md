---
name: deployment
description: Deployment workflow guidelines. Use when deploying applications.
---

# Skill: deployment

## When to Use This Skill

Use this skill when:
- User is about to deploy to production
- Setting up a deployment pipeline
- Choosing a hosting platform

## Before Every Deploy

Run these in order. Do not deploy if any fail:

1. `npm test` — all tests pass
2. `npm run build` — build succeeds locally
3. Check all required env vars are set in the target environment
4. Review the diff — confirm no debug code, no hardcoded secrets, no console.logs

If the project has no tests, flag it before deploying. Deploying untested code to production is a risk worth naming.

## Platform Decision

| Platform | Use when |
|----------|----------|
| Vercel | Next.js, React SPA, static + serverless |
| Netlify | Static sites, simple serverless functions |
| Railway | Full-stack Node.js, needs a database |
| Fly.io | Docker-based, needs persistent servers |
| Docker + VPS | Full control, complex infra, self-hosted |

When unsure, ask the user: "What does this app need — just static files, serverless functions, or a persistent server?"

## After Deploy

Verify the deployment actually works — do not assume success from a green CI:

- Hit the production URL and confirm the app loads
- Test the critical path (login, main feature, checkout — whatever matters most)
- Check error monitoring (Sentry, Datadog) for new errors in the first 5 minutes

## Rollback

Know how to roll back before you deploy:
- Vercel/Netlify: re-deploy a previous deployment from the dashboard
- Railway: redeploy a previous image
- Docker: `docker run` previous image tag

If there is no rollback plan, create one before deploying.
