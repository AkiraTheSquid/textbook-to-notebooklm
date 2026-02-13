#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="/home/stellar-thread/Applications/pdf-split-tool"
DEPLOY_DIR="/home/stellar-thread/Applications/pdf-split-tool-deployed"

if [ ! -d "$DEPLOY_DIR/.git" ]; then
  echo "Deploy worktree not found. Run:"
  echo "  git -C \"$REPO_DIR\" worktree add -b deploy \"$DEPLOY_DIR\""
  exit 1
fi

git -C "$DEPLOY_DIR" fetch origin
git -C "$DEPLOY_DIR" pull --ff-only

git -C "$REPO_DIR" checkout main
git -C "$REPO_DIR" merge deploy

echo "Local worktree updated from deploy."
