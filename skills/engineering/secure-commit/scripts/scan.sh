#!/usr/bin/env bash
# Scans for sensitive data in staged changes and local git history.
# Remote scanning (GitHub) is handled by the agent directly, not this script.
# Usage:
#   ./scan.sh staged     — check currently staged files only
#   ./scan.sh commits    — check last N commits (default 10)
#   ./scan.sh history    — check full git history (slow on large repos)
#   ./scan.sh all        — staged + full history (default when no arg given)

set -euo pipefail

MODE="${1:-all}"
COMMIT_DEPTH="${2:-10}"
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

FINDINGS=0

# ── Sensitive filename patterns ─────────────────────────────────────
SENSITIVE_FILENAMES=(
  '\.env$'
  '\.env\.'
  '\.pem$' '\.key$' '\.p12$' '\.pfx$' '\.cer$' '\.crt$'
  'id_rsa' 'id_ed25519' 'id_ecdsa' 'id_dsa'
  '\.keystore$' '\.jks$'
  'credentials\.json' 'credentials\.ya?ml'
  'secrets\.json' 'secrets\.ya?ml'
  'serviceAccountKey\.json' 'service-account.*\.json'
  'firebase-adminsdk.*\.json'
  '\.tfvars$'
  '\.netrc$' 'netrc$'
  '\.htpasswd$' 'htpasswd$'
  'aws_credentials'
  'application_default_credentials\.json'
)

# ── Sensitive content patterns ───────────────────────────────────────
SENSITIVE_CONTENT=(
  'password\s*[:=]\s*\S+'
  'passwd\s*[:=]\s*\S+'
  'secret\s*[:=]\s*\S+'
  'api[_-]?key\s*[:=]\s*\S+'
  'auth[_-]?token\s*[:=]\s*\S+'
  'access[_-]?token\s*[:=]\s*\S+'
  'private[_-]?key\s*[:=]\s*\S+'
  'client[_-]?secret\s*[:=]\s*\S+'
  'BEGIN (RSA|EC|DSA|OPENSSH|PGP) PRIVATE KEY'
  'AWS_SECRET_ACCESS_KEY'
  'AWS_ACCESS_KEY_ID\s*[:=]\s*AKIA'
  'AKIA[0-9A-Z]{16}'
  'ghp_[0-9a-zA-Z]{36}'
  'github_pat_[0-9a-zA-Z_]{82}'
  'xox[baprs]-[0-9a-zA-Z]'
  'sk-[a-zA-Z0-9]{32,}'
  'SG\.[a-zA-Z0-9_-]{22}\.[a-zA-Z0-9_-]{43}'
  'AIza[0-9A-Za-z_-]{35}'
  'ya29\.[0-9A-Za-z_-]+'
  'eyJ[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+'
  'postgres://[^:]+:[^@]+@'
  'mysql://[^:]+:[^@]+@'
  'mongodb\+srv://[^:]+:[^@]+@'
  'redis://:?[^@]+@'
)

flag_filename() {
  local file="$1" source="$2"
  echo -e "${RED}[SENSITIVE FILE]${NC} ${source}: ${file}"
  FINDINGS=$((FINDINGS + 1))
}

flag_content() {
  local file="$1" pattern="$2" source="$3" line="$4"
  echo -e "${YELLOW}[SENSITIVE CONTENT]${NC} ${source}: ${file}"
  echo "  pattern: ${pattern}"
  [ -n "$line" ] && echo "  match:   ${line}"
  FINDINGS=$((FINDINGS + 1))
}

check_filenames() {
  local files=("$@")
  for f in "${files[@]}"; do
    for pat in "${SENSITIVE_FILENAMES[@]}"; do
      if echo "$f" | grep -qE "$pat"; then
        flag_filename "$f" "filename"
        break
      fi
    done
  done
}

check_content_in_diff() {
  local diff_output="$1" source="$2"
  for pat in "${SENSITIVE_CONTENT[@]}"; do
    while IFS= read -r line; do
      # Extract filename from diff header
      if [[ "$line" =~ ^\+\+\+\ b/(.+) ]]; then
        current_file="${BASH_REMATCH[1]}"
      fi
      # Only scan added lines (skip removed lines and diff headers)
      if [[ "$line" =~ ^\+ ]] && [[ ! "$line" =~ ^\+\+\+ ]]; then
        if echo "$line" | grep -qiE "$pat"; then
          flag_content "${current_file:-unknown}" "$pat" "$source" "${line:0:120}"
        fi
      fi
    done <<< "$diff_output"
  done
}

# ── Staged check ──────────────────────────────────────────────────────
scan_staged() {
  echo "==> Scanning staged changes..."
  local staged_files
  staged_files=$(git diff --cached --name-only 2>/dev/null || true)

  if [ -z "$staged_files" ]; then
    echo "    No staged files."
    return
  fi

  mapfile -t files_arr <<< "$staged_files"
  check_filenames "${files_arr[@]}"

  local staged_diff
  staged_diff=$(git diff --cached 2>/dev/null || true)
  [ -n "$staged_diff" ] && check_content_in_diff "$staged_diff" "staged"
}

# ── Recent commits check ──────────────────────────────────────────────
scan_commits() {
  local depth="$1"
  echo "==> Scanning last ${depth} commits..."

  local commit_hashes
  commit_hashes=$(git log --oneline -"$depth" --format="%H" 2>/dev/null || true)

  if [ -z "$commit_hashes" ]; then
    echo "    No commits found."
    return
  fi

  while IFS= read -r hash; do
    local short="${hash:0:8}"
    local commit_files
    commit_files=$(git diff-tree --no-commit-id -r --name-only "$hash" 2>/dev/null || true)

    mapfile -t files_arr <<< "$commit_files"
    for f in "${files_arr[@]}"; do
      [ -z "$f" ] && continue
      for pat in "${SENSITIVE_FILENAMES[@]}"; do
        if echo "$f" | grep -qE "$pat"; then
          flag_filename "$f" "commit:${short}"
          break
        fi
      done
    done

    local commit_diff
    commit_diff=$(git show "$hash" 2>/dev/null || true)
    [ -n "$commit_diff" ] && check_content_in_diff "$commit_diff" "commit:${short}"
  done <<< "$commit_hashes"
}

# ── Full history check ────────────────────────────────────────────────
scan_history() {
  echo "==> Scanning full git history (this may take a while)..."
  local total
  total=$(git rev-list --count HEAD 2>/dev/null || echo "?")
  echo "    Total commits: ${total}"

  scan_commits "$total"
}

# ── Main ──────────────────────────────────────────────────────────────
case "$MODE" in
  staged)   scan_staged ;;
  commits)  scan_commits "$COMMIT_DEPTH" ;;
  history)  scan_history ;;
  all)      scan_staged; scan_history ;;
  *)        echo "Usage: $0 [staged|commits|history|all] [depth]"; exit 1 ;;
esac

echo ""
if [ "$FINDINGS" -eq 0 ]; then
  echo -e "${GREEN}No sensitive data found.${NC}"
  exit 0
else
  echo -e "${RED}Found ${FINDINGS} issue(s). See above for details.${NC}"
  exit 1
fi
