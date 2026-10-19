## Python
- Use uv for everything (`uv add`, `uv run`, `uv sync`); never pip or a bare venv
- Lint and format with ruff, type-check with mypy, test with pytest in tests/
- Type hints on public functions; use logging rather than print() for diagnostics

## JavaScript/TypeScript
- npm, and the Node version the project pins; format with prettier if the project has it

## Git and GitHub
- Commit messages: concise, imperative mood, explain why
- git over SSH for push/pull/clone; gh for PRs, issues, reviews, repo creation and Pages

## Dotfiles
- Managed by chezmoi (source in ~/.local/share/chezmoi): edit the source and run
  `chezmoi apply`; never edit ~/.vimrc, ~/.gitconfig and so on directly
