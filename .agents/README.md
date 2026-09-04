# .agents

Single source of truth for config shared across coding agents (Claude Code,
Codex, Copilot CLI). Run `../.scripts/link-agents.sh` to wire everything up;
re-run after adding or renaming rules (it regenerates `AGENTS.md`).

## Layout

- `rules/` - one markdown file per topic of global instructions
- `skills/` - agent skills, one folder per skill with a `SKILL.md`
- `agents/` - custom subagent definitions (formats differ per tool)
  - `agents/claude/` - Claude Code subagents, `*.md` (linked to `~/.claude/agents`)
  - `agents/copilot/` - Copilot custom agents, `*.agent.md` (linked to `~/.copilot/agents`)
- `commands/` - Claude Code slash commands, `*.md` (linked to `~/.claude/commands`)
- `hooks/` - hook scripts and per-tool hook config
  - `hooks/scripts/` - shared hook scripts, referenced from per-tool config
  - `hooks/copilot/` - Copilot hook JSON files (linked to `~/.copilot/hooks`)
  - `hooks/codex.json` - Codex hooks config (linked if present)
- `AGENTS.md` - generated concatenation of `rules/`, do not edit
- `.skill-lock.json` - lockfile written by the skill installer

## How each tool consumes it

| | rules | skills | agents | instructions file |
|---|---|---|---|---|
| Claude Code | `~/.claude/rules` -> `rules/` | `~/.claude/skills` -> `skills/` | `~/.claude/agents` -> `agents/claude/` | reads rules natively |
| Codex | n/a (single file) | reads `~/.agents/skills` natively | n/a | `~/.codex/AGENTS.md` -> `AGENTS.md` |
| Copilot CLI | n/a (single file) | `~/.copilot/skills` -> `skills/` | `~/.copilot/agents` -> `agents/copilot/` | `~/.copilot/copilot-instructions.md` -> `AGENTS.md` |

`~/.agents` itself is a symlink to this folder, so skills installed with the
skill installer land in the repo and can be committed.

Claude Code hooks are configured in `../.claude/settings.json` (linked to
`~/.claude/settings.json`); put shared hook scripts here and reference them
from there. Codex `.rules` files (`~/.codex/rules/*.rules`) are sandbox exec
policy, not instructions, and stay tool-local.
