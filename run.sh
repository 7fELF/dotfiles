#!/bin/bash
set -ex

DOTFILES_FOLDER="$PWD/$(dirname "$0")"
LN="ln -sf"

PACKAGES=(
  git
  vim
  rsync
  htop
  zip unzip
  gzip tar
  tmux
  httpie
  tree
)

if [ -x "$(command -v apt-get)" ];
then
  echo "Installing packages"
  sudo apt-get install -y "${PACKAGES[@]}"
else
  echo "Can't install packages without apt"
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

mkdir -p "$HOME/.config/terminator/"
$LN "$DOTFILES_FOLDER/config/terminator/config" "$HOME/.config/terminator/config"

mkdir -p  ~/.vim/bundle/
rm -Rf "$HOME/.vim/bundle/Vundle.vim"
git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
vim +PluginInstall +qall
reset

