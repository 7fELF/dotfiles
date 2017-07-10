#!/bin/bash
# Change the remote from https to ssh

DOTFILES_FOLDER="$PWD/$(dirname "$0")"
sed -i "s/https:\/\/github.com\/7fELF/git@github.com:\/7fELF/" "$DOTFILES_FOLDER/.git/config"
