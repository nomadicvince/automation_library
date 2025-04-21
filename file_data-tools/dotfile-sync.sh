#!/bin/bash
# dotfile-sync.sh

echo "==== Dotfile Sync Tool ===="

DOTFILES=(".bashrc" ".vimrc" ".gitconfig")
REPO_DIR="$HOME/dotfiles"

mkdir -p "$REPO_DIR"

for file in "${DOTFILES[@]}"; do
  cp "$HOME/$file" "$REPO_DIR/"
done

cd "$REPO_DIR" || exit
git add .
git commit -m "Update dotfiles $(date +%F)"
git push

echo "Dotfiles synced to GitHub."