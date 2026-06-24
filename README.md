# dotfiles

Personal configuration for a modern command-line setup — shell, git, editor,
and prompt. Files use the `dot_` prefix convention (e.g. `dot_vimrc` →
`~/.vimrc`), which works with [chezmoi](https://www.chezmoi.io/) and with the
included `install.sh`.

## What's here

| File | Links to | Purpose |
|------|----------|---------|
| `dot_zshrc` | `~/.zshrc` | Lightweight, framework-free zsh: history, completion cache, prefix-search history keys |
| `dot_bashrc` | `~/.bashrc` | Matching bash config for servers where bash is the default |
| `dot_aliases` | `~/.aliases` | Shared aliases (sourced by both shells) with graceful fallbacks |
| `dot_gitconfig` | `~/.gitconfig` | Modern git defaults + aliases |
| `dot_gitignore_global` | `~/.gitignore_global` | OS/editor/secret cruft ignored in every repo |
| `dot_editorconfig` | `~/.editorconfig` | Baseline formatting for projects without their own |
| `dot_tmux.conf` | `~/.tmux.conf` | 1-based indexing, mouse, vi copy-mode, true color |
| `dot_vimrc` | `~/.vimrc` | Sensible vim defaults with persistent undo |
| `dot_config/starship.toml` | `~/.config/starship.toml` | Fast, font-safe cross-shell prompt |

## Install

```sh
git clone <this-repo> ~/dotfiles
cd ~/dotfiles
./install.sh        # symlinks everything into $HOME, backing up what's there
```

Or with chezmoi: `chezmoi init --apply <this-repo>`.

## Recommended tools

The shell configs detect these and light up automatically — nothing breaks if
they're missing.

| Tool | Replaces / adds | Why |
|------|-----------------|-----|
| [starship](https://starship.rs) | prompt | Fast, informative, cross-shell |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | `cd` | Jump to frequent dirs (`z foo`) |
| [fzf](https://github.com/junegunn/fzf) | history/file search | `Ctrl-R`, `Ctrl-T` fuzzy finding |
| [eza](https://github.com/eza-community/eza) | `ls` | Colors, git status, tree view |
| [bat](https://github.com/sharkdp/bat) | `cat` | Syntax highlighting, paging |
| [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`) | `grep` | Much faster, gitignore-aware |
| [fd](https://github.com/sharkdp/fd) | `find` | Friendlier, faster |
| [delta](https://github.com/dandavison/delta) | git pager | Side-by-side, syntax-highlighted diffs |

Install them (pick your distro):

```sh
# Arch
sudo pacman -S starship zoxide fzf eza bat ripgrep fd git-delta

# Debian / Ubuntu (note: bat -> batcat, fd -> fdfind)
sudo apt install fzf bat ripgrep fd-find
# starship, zoxide, eza, delta: see each project's install docs

# Fedora
sudo dnf install fzf bat ripgrep fd-find zoxide
# starship, eza, delta: see each project's install docs
```

A [Nerd Font](https://www.nerdfonts.com/) (e.g. JetBrainsMono Nerd Font) is
optional — the prompt is designed to look fine without one.

### Optional: use delta for git diffs

`dot_gitconfig` stays tool-agnostic so it works on machines without delta. To
enable it once delta is installed, add to `~/.gitconfig`:

```ini
[core]
    pager = delta
[interactive]
    diffFilter = delta --color-only
[delta]
    navigate = true
[merge]
    conflictstyle = zdiff3
```
