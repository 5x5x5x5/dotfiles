## Python Projects
- Always use `uv` — never pip or venv directly
- Linting: ruff. Type checking: mypy. Formatting: ruff format
- Tests: pytest in tests/ directory

## JavaScript/TypeScript Projects
- Node 22, npm
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
