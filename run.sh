#!/bin/bash
set -ex

DOTFILES_FOLDER="$(dirname "$(realpath "$0")")"

if [ ! -x "$(command -v apt-get)" ]; then
  echo "Can't install packages without apt"
  exit 1
fi

LN="ln -sf"

PACKAGES=(
  git
  curl wget
  vim
  rsync
  htop
  zip unzip
  gzip tar
  tmux
  httpie
  tree
  links
  shellcheck
  jq
  detox
  rename
)

if [ -x "$(command -v apt-get)" ]; then
  echo "Installing packages"
  sudo apt-get install -y "${PACKAGES[@]}"
else
  echo "Can't install packages without apt"
  sleep 3
fi

$LN "$DOTFILES_FOLDER/vimrc"              "$HOME/.vimrc"
$LN "$DOTFILES_FOLDER/tmux.conf"          "$HOME/.tmux.conf"
$LN "$DOTFILES_FOLDER/zshrc"              "$HOME/.zshrc"
$LN "$DOTFILES_FOLDER/editorconfig"       "$HOME/.editorconfig"
$LN "$DOTFILES_FOLDER/gitconfig"          "$HOME/.gitconfig"
$LN "$DOTFILES_FOLDER/vim"                "$HOME/.vim"
$LN "$DOTFILES_FOLDER/selected_editor"    "$HOME/.selected_editor"
$LN "$DOTFILES_FOLDER/ycm_extra_conf.py"  "$HOME/.ycm_extra_conf.py"
$LN "$DOTFILES_FOLDER/ideavimrc"          "$HOME/.ideavimrc"
$LN "$DOTFILES_FOLDER/Xresources"          "$HOME/.Xresources"

mkdir -p "$HOME/.config/terminator/"
$LN "$DOTFILES_FOLDER/config/terminator/config" "$HOME/.config/terminator/config"

rm -rf "$HOME/.vim/autoload"
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
vim +PlugClean! +PlugInstall +qall && reset
