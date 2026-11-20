#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
target="$HOME/.claude/CLAUDE.md"

mkdir -p "$HOME/.claude"

if [ -L "$target" ] && [ "$(readlink "$target")" = "$repo_dir/CLAUDE.md" ]; then
  echo "Already linked: $target -> $repo_dir/CLAUDE.md"
  exit 0
fi

if [ -e "$target" ] || [ -L "$target" ]; then
  backup="$target.backup-$(date +%Y%m%d%H%M%S)"
  mv "$target" "$backup"
  echo "Existing file moved to $backup"
fi

ln -s "$repo_dir/CLAUDE.md" "$target"
echo "Linked: $target -> $repo_dir/CLAUDE.md"
