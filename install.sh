#!/bin/sh
#
#   'curl -sSL https://raw.githubusercontent.com/7fELF/dotfiles/master/install.sh | sh'
#   or:
#   'wget -qO- https://raw.githubusercontent.com/7fELF/dotfiles/master/install.sh | sh'
#
set -ex

if [ "$(id -u)" -eq 0 ]; then
  echo "Don't run this as root"
  exit
fi

sudo apt-get update
sudo apt-get install -y git

cd "$HOME"
git clone --recursive https://github.com/7fELF/dotfiles.git
cd dotfiles

./run.sh
./theme.sh
./clean_ubuntu.sh
./set_ssh_remote.sh
