#!/bin/bash
# Fires on every UserPromptSubmit.
# Injects current git branch, environment, and dirty-file count into context so
# Claude always knows what state the working tree is in without being asked.

CONFIG="$PWD/.claude/config.json"

PROJECT="unknown"
ENV="unknown"
if [ -f "$CONFIG" ]; then
    PROJECT=$(grep -o '"name"[[:space:]]*:[[:space:]]*"[^"]*"' "$CONFIG" | head -1 | cut -d'"' -f4)
    ENV=$(grep -o '"environment"[[:space:]]*:[[:space:]]*"[^"]*"' "$CONFIG" | head -1 | cut -d'"' -f4)
fi

BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")
DIRTY=$(git status --short 2>/dev/null | wc -l | tr -d ' ')

echo "[ctx] project=$PROJECT | env=$ENV | branch=$BRANCH | dirty=$DIRTY"
