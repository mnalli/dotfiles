#!/bin/sh

DOTFILES_DIR=~/.dotfiles

# TODO: use -f?

# link all home dotfiles
ln -s $(find "$DOTFILES_DIR" -maxdepth 1 -type f -name '.*') ~/

# link .config sub-directories
ln -s "$DOTFILES_DIR"/.config/* ~/.config/

# link .local sub-directories
ln -s "$DOTFILES_DIR"/.local/bin/* ~/.local/bin/
ln -s "$DOTFILES_DIR"/.local/share/* ~/.local/share/
ln -s "$DOTFILES_DIR"/.local/src/* ~/.local/src/
