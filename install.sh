#!/bin/bash
#
#   'curl -sSL https://raw.githubusercontent.com/antoinegergy/dotfiles/master/install.sh | sh'
#   or:
#   'wget -qO- https://raw.githubusercontent.com/antoinegergy/dotfiles/master/install.sh | sh'
#
set -ex

PACKAGES=(
  vim
  git
  rsync
  zsh
  htop
  zip unzip
  gzip tar
  tmux
  httpie
  wget curl
)

if [ "$(id -u)" != "0" ];
then
  SUDO='sudo'
else
  SUDO=''
fi

if [ -x "$(command -v apt-get)" ];
then
  echo "Installing packages"
  $SUDO apt-get update && \
    $SUDO apt-get install -y "${PACKAGES[@]}"
  echo "Installing oh-my-zsh"
  wget -qO- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
else
  echo "Can't install packages without apt"
fi

cd "$HOME"
git clone https://github.com/antoinegergy/dotfiles.git
(cd dotfiles && ./run.sh)
