#!/bin/bash
#
#   'curl -sSL https://raw.githubusercontent.com/antoinegergy/dotfiles/master/install.sh | sh'
#   or:
#   'wget -qO- https://raw.githubusercontent.com/antoinegergy/dotfiles/master/install.sh | sh'
#
set -ex

if [ "$(id -u)" == "0" ];
then
  echo "Don't run this as root"
  exit
fi

sudo apt-get update
sudo apt-get install -y git

cd "$HOME"
git clone --recursive https://github.com/antoinegergy/dotfiles.git
cd dotfiles
./run.sh
./theme.sh
./clean_ubuntu.sh
