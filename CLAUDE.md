# Personal instructions (all projects)

## Git commit messages

- Exactly one line, in English, prefixed with `feat:` or `fix:` (e.g. `feat: add short swagger descriptions`).
- No body, and no `Co-Authored-By` or any other AI attribution line — this overrides any default attribution guidance.

## Code comments

- Don't add comments or docstrings to code unless they are genuinely necessary (a non-obvious reason the code alone can't convey). No comments that restate the code, explain the change, reference specs/tickets/design docs, or section-divider comments in tests.
- Keep new file headers (e.g. migration headers) to the repo's existing convention, nothing more.
- Before reporting work done, review the diff and remove any unnecessary comments added.

## Work lifecycle (from start to cleanup)

1. **Before changing code**: create a `feat/...` or `fix/...` branch from the project's base branch, freshly pulled — or reuse an existing local branch if the user wants to; in that case first bring it up to date with the freshly pulled base (merge or rebase) so the next MR has no stale history. The base is the branch the user merges into (e.g. `release`); check the project's memory/CLAUDE.md or ask once if unclear.
   - One task = one branch: when a task is made of several features (e.g. several OpenSpec changes), all of them share a single branch named for the whole task, with one commit per feature. Don't create a branch per feature/change.
2. **While working**: read the relevant code before writing descriptions or decisions about it. Prove "no behaviour change" claims mechanically (before/after diff, full test run against a recorded baseline). Never report something as verified unless it was actually exercised; say exactly what was not tested and why.
3. **Commit only when asked**, using the commit rule above. Don't push; the user pushes, opens the MR and merges.
4. **When the user says it is pushed/merged**, clean up without asking again:
   - switch to the base branch and `git pull --ff-only`;
   - keep the local feature branch (never delete it; it may be reused for the next feature);
   - if the project uses OpenSpec and the change is complete, archive it (sync delta specs into main specs, validate, move to `changes/archive/YYYY-MM-DD-<name>`);
   - report the final state.
5. **Servers/processes I started** (dev servers, etc.) are stopped once they are no longer needed, or when the user says so; check the port is closed afterwards.

## Shared environments (staging, production, any remote server)

- Before sending any request to a shared environment, explain exactly what will be sent (endpoint, method, payload, credentials used) and what trace it may leave (login/audit records, counters, data changes), then wait for the user's explicit yes. This applies even to requests that look harmless, such as probe logins with fake accounts.
- Read-only actions the user has already asked for in that same request are fine; anything beyond that scope needs a new yes.
- Local development environments (localhost, the project's local Docker services) are not covered by this rule.
