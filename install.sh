#!/usr/bin/env bash
# install.sh — symlink the dotfiles in this repo into $HOME.
#
#   dot_foo            ->  ~/.foo
#   dot_config/<path>  ->  ~/.config/<path>
#
# Existing real files are moved to ~/.dotfiles-backup/<timestamp>/ before a
# symlink replaces them. Re-running just refreshes the links (idempotent).
#
# Usage:  ./install.sh

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

# Pretty-print a path with $HOME collapsed to ~.
tilde() { printf '%s' "${1/#$HOME/~}"; }

link() {
  local src="$1" dest="$2"

  # Already pointing where we want? Nothing to do.
  if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
    return
  fi

  # Back up anything real (or a stale symlink) that's in the way.
  if [[ -e "$dest" || -L "$dest" ]]; then
    local rel="${dest#"$HOME"}"
    mkdir -p "$BACKUP_DIR$(dirname "$rel")"
    mv "$dest" "$BACKUP_DIR$rel"
    echo "backup  $(tilde "$dest")"
  fi

  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "link    $(tilde "$dest") -> $(tilde "$src")"
}

# Top-level dot_* files (dot_config is handled recursively below).
for src in "$DOTFILES_DIR"/dot_*; do
  name="$(basename "$src")"
  [[ "$name" == "dot_config" ]] && continue
  link "$src" "$HOME/.${name#dot_}"
done

# dot_config/<path> -> ~/.config/<path>
if [[ -d "$DOTFILES_DIR/dot_config" ]]; then
  while IFS= read -r -d '' src; do
    rel="${src#"$DOTFILES_DIR"/dot_config/}"
    link "$src" "$HOME/.config/$rel"
  done < <(find "$DOTFILES_DIR/dot_config" -type f -print0)
fi

echo "Done.${BACKUP_DIR:+ Backups (if any) in $(tilde "$BACKUP_DIR").}"
