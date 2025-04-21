#!/bin/bash
# git-status-checker.sh

echo "==== Git Repository Status Checker ===="

REPO_BASE="$HOME/dev"

for repo in "$REPO_BASE"/*; do
  if [[ -d "$repo/.git" ]]; then
    echo "== $(basename "$repo") =="
    cd "$repo" || continue
    git status --short
    echo ""
  fi
done