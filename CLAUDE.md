# CLAUDE.md

## This repository

Personal **dotfiles** — shell, git, editor, tmux, and prompt configuration.

### Naming convention (`dot_` prefix)

Files are stored without a leading dot and mapped into `$HOME` on install:

- `dot_foo` → `~/.foo` (e.g. `dot_zshrc` → `~/.zshrc`)
- `dot_config/<path>` → `~/.config/<path>` (e.g. `dot_config/starship.toml` → `~/.config/starship.toml`)

This is compatible with [chezmoi](https://www.chezmoi.io/) and with the repo's
own `install.sh`, which symlinks each `dot_*` into `$HOME`, backing up anything
it replaces to `~/.dotfiles-backup/<timestamp>/`. Adding a new config file means
adding a new `dot_*` entry — `install.sh` picks it up with no edits.

### Working in this repo

- **Target Linux only.** Configs assume various Linux distros and terminals —
  no macOS or Windows accommodations (no Homebrew paths, no `.DS_Store`/Windows
  ignores, no BSD-`ls` branch). Don't re-add them.
- **Keep shell configs portable across Linux.** Tool integrations (starship,
  zoxide, fzf, eza, …) must be guarded — `command -v tool >/dev/null && …` — so
  the files are safe to drop on any host where those tools aren't installed.
- **Don't shadow standard tools.** `cat`/`grep`/`find` are left alone; their
  rewrites (`bat`/`rg`/`fd`) are used by their own names.
- **`dot_aliases` is shared** by both `dot_zshrc` and `dot_bashrc` — put common
  aliases there, not in a single shell's rc.
- **Keep `dot_gitconfig` tool-agnostic.** Don't hardcode optional tools (e.g.
  `delta`) as defaults; document opt-in snippets in `README.md` instead.
- **The starship prompt is font-safe** — avoid Nerd Font private-use glyphs so
  it renders in any monospace font.
- **Validate before committing:** `bash -n <file>` for bash scripts,
  `zsh -n dot_zshrc` for zsh, and `git config --file dot_gitconfig --list` to
  confirm the gitconfig parses.
- Update `README.md`'s file table when adding or removing a config file.

## Python Projects
- Always use `uv` — never pip or venv directly
- Linting: ruff. Type checking: mypy. Formatting: ruff format
- Tests: pytest in tests/ directory

## JavaScript/TypeScript Projects
- Node 24, npm
- Format with prettier when available in project

## Workflow Preferences
- Start complex tasks in Plan mode (Shift+Tab twice)
- Use git worktrees for parallel work on the same repo
- Commit messages: concise, imperative mood, focus on "why"
- Each project should have its own CLAUDE.md
- GitHub: git + SSH for push/pull/clone; gh CLI allowed for PRs, issues, reviews, repo creation, and enabling Pages

## Conventions
- Type hints on all public Python functions
- No print() for logging — use logging module
- Keep files focused and small
- Default branch is always `main`, never `master`
