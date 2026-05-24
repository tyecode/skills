---
name: secure-commit
description: Pre-commit safety check and passive guardrail against sensitive files. Invoke with /secure-commit to scan staged files or audit git history. Install globally to block leaks automatically before every commit.
---

# Skill: secure-commit

## When to Use This Skill

**Explicit invocation** — run `/secure-commit` to scan what's staged right now before committing, or audit past commits for leaked secrets.

**Passive guardrail** — install globally and it applies automatically before every `git add` or `git commit`.

## Invocation Modes

```
/secure-commit              → staged files only (default)
/secure-commit commits      → staged + last 10 commits
/secure-commit commits 50   → staged + last N commits
/secure-commit history      → full local git history
/secure-commit remote       → what's currently tracked on GitHub remote
/secure-commit all          → everything above
```

The bundled script handles all local scans. Remote scanning is done by the agent directly using git and gh commands.

```bash
bash <skill-dir>/scripts/scan.sh [staged|commits|history|all] [depth]
```

### All scan (`/secure-commit all`)

Run each scan in sequence and collect all findings before fixing anything:

1. **Staged** — `git diff --cached --name-only`
2. **Full local history** — `git log --all --full-history --name-only --format="%H %s"`
3. **Remote** — fetch and inspect all remote branches (see below)

After collecting findings from all three, report a summary grouped by category, then apply the appropriate fix protocol for each finding.

### Remote scan (`/secure-commit remote`)

Check what sensitive files are currently tracked on the GitHub remote:

```bash
git fetch origin
git ls-tree -r --name-only origin/<default-branch>
```

Scan the output against all blocked filename patterns. If anything matches, report it with the full path and which remote branch it was found on.

Also check all remote branches, not just the default:

```bash
git branch -r --format='%(refname:short)'
```

For each branch, run `git ls-tree -r --name-only <branch>` and scan the results.

## Blocked File Patterns

Never stage or commit files matching these patterns, regardless of what the user asks:

**Environment files**
- `.env`, `.env.*`, `*.env`

**Secrets and credentials**
- `*.pem`, `*.key`, `*.p12`, `*.pfx`, `*.cer`, `*.crt`
- `id_rsa`, `id_ed25519`, `id_ecdsa`, `id_dsa`
- `*.keystore`, `*.jks`
- `credentials.json`, `credentials.yml`, `credentials.yaml`
- `secrets.json`, `secrets.yml`, `secrets.yaml`

**Cloud and service configs**
- `.aws/credentials`, `aws_credentials`
- `gcloud/application_default_credentials.json`
- `serviceAccountKey.json`, `service-account*.json`
- `firebase-adminsdk*.json`
- `*.tfvars`

**Auth tokens and API keys**
- `.npmrc` (with auth token), `.pypirc`, `.netrc`, `.htpasswd`

**Database**
- `*.sqlite`, `*.sqlite3`, `*.db` (unless clearly test fixtures)
- `pg_hba.conf`

## Sensitive Content Patterns

Also scan file content for:
- `password=`, `secret=`, `api_key=`, `token=`
- `BEGIN RSA/EC/OPENSSH PRIVATE KEY`
- AWS keys (`AKIA...`), GitHub PATs (`ghp_...`), Slack tokens (`xox*`), OpenAI keys (`sk-...`)
- Database URLs with embedded credentials (`postgres://user:pass@...`)

## Hard Rules (Passive Mode)

**CRITICAL: Never commit sensitive files, even when explicitly asked.**

If the user says "commit everything" or uses `git add .`:
1. Run `git status` first
2. Scan the file list against the blocked patterns
3. Stop and report any matches before staging
4. Remove those files from the staging command

If a sensitive file is already staged:
```bash
git reset HEAD <sensitive-file>
```

## .gitignore Enforcement

When a project lacks `.gitignore` entries for sensitive files, add them before the first commit:

```
.env
.env.*
!.env.example
!.env.template
*.pem
*.key
*.p12
credentials.json
serviceAccountKey.json
```

## Fix Protocol

### Sensitive file is staged

```bash
git reset HEAD <file>
echo "<pattern>" >> .gitignore
git add .gitignore
```

### Sensitive file is in a local commit (not pushed)

Rotate the secret first — treat it as exposed. Then:

```bash
# Remove file from history
git filter-repo --path <file> --invert-paths

# Or rewrite a single commit
git rebase -i HEAD~<N>
# mark commit as 'edit', then:
git rm --cached <file>
git commit --amend
git rebase --continue
```

### Sensitive file is in pushed history

1. **Rotate the secret immediately** — assume it's compromised. This is the only guaranteed fix.
2. Notify your team — they need to re-clone or hard-reset after history is rewritten.
3. Rewrite local history:
   ```bash
   git filter-repo --path <file> --invert-paths
   ```
4. Force-push to remove it from GitHub:
   ```bash
   git push --force-with-lease origin <branch>
   ```
   If on `main`/`master`, confirm with the user before force-pushing.
5. Remove the file from all other remote branches that contain it:
   ```bash
   # For each affected branch
   git checkout <branch>
   git filter-repo --path <file> --invert-paths
   git push --force-with-lease origin <branch>
   ```
6. Delete any GitHub Actions workflow runs that may have logged the secret:
   ```bash
   gh run list --limit 50
   gh run delete <run-id>
   ```
7. Warn the user about what cannot be automatically fixed:
   - GitHub caches old git objects — they must contact GitHub support to purge them
   - Forks of the repo still have the old history — notify fork owners
   - Merged PR diffs may still show the old content — request removal via GitHub support

### Hardcoded secret in source code

1. Move the value to `.env` and reference via `process.env.VAR_NAME`
2. Add `.env` to `.gitignore`
3. Amend or create a new commit removing the hardcoded value
4. Rotate the exposed secret

## Safe Alternatives

```
.env.example     ← commit this (placeholder values only)
.env             ← never commit (real values, gitignored)
```

For sharing secrets with the team: use a secrets manager (AWS Secrets Manager, Vault, 1Password) or CI/CD environment variables (GitHub Actions secrets, Vercel env vars).
