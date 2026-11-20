# claude-dotfiles

Personal global instructions for Claude Code (`~/.claude/CLAUDE.md`), shared across machines.

## Install on a machine

```sh
git clone <this-repo-url> ~/claude-dotfiles
~/claude-dotfiles/install.sh
```

`install.sh` symlinks `~/.claude/CLAUDE.md` to `CLAUDE.md` in this repo. An existing file is moved to `~/.claude/CLAUDE.md.backup-<timestamp>` first. Running it again is safe.

## Update

Edit `~/.claude/CLAUDE.md` (it is the repo file), then commit and push. On other machines, `git pull`.
