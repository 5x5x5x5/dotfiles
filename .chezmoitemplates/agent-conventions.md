## Python
- Use uv for everything (`uv add`, `uv run`, `uv sync`), not pip or a bare venv:
  projects are locked with uv.lock, and a pip install drifts from it
- ruff for lint and format, ty for types, pytest with tests in tests/; where a
  project's own config names other tools, the project wins

## JavaScript/TypeScript
- npm, and the Node version the project pins; prettier if the project has it

## Git and GitHub
- Git remotes use SSH (`git@github.com:...`), the one auth method set up on every
  machine; use gh for PRs, issues, reviews, repo creation and Pages
- The default branch is `main`, including in new repos
- The same repos are edited from several machines, so a local checkout is often
  behind: fetch and compare with origin before reading or editing

## Dotfiles
- chezmoi manages them, this file included (source in ~/.local/share/chezmoi).
  `chezmoi apply` overwrites direct edits to ~/.vimrc, ~/.gitconfig and the like,
  so edit the source and then apply

## Working style
- Carry a task through without stopping for approval. Stop and ask first only
  before something hard to undo or visible to others (push, delete, deploy, send)
  that I did not ask for
- Use git worktrees for parallel work on one repo, so two tasks never share a
  working tree
- Split a file once it holds more than one concern
- Use subagents freely for work that can run on its own (searches, independent
  tasks, reviews): it keeps the main context small. Give each subagent the least
  powerful model that can do its task well
