#!/usr/bin/env bash
# Sync the published site from the source repo (cnj-landing/public) and push to GitHub Pages.
# Usage: ./sync.sh [path-to-public]   (defaults to ../cnj-landing/public)
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="${1:-$HERE/../cnj-landing/public}"

if [ ! -d "$SRC" ]; then
  echo "Source folder not found: $SRC" >&2
  exit 1
fi

rsync -a --delete \
  --exclude='.git' --exclude='.nojekyll' --exclude='README.md' --exclude='sync.sh' \
  "$SRC"/ "$HERE"/

cd "$HERE"
git add -A
if git diff --cached --quiet; then
  echo "No changes to publish."
  exit 0
fi
git commit -m "Sync site $(date +%F)"
git push
echo "Published → https://fabiopauli.github.io/curso-lia3r/"
