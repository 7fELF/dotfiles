#!/bin/sh
#
#   'curl -sSL https://raw.githubusercontent.com/antoinegergy/dotfiles/master/install.sh | sh'
#   or:
#   'wget -qO- https://raw.githubusercontent.com/antoinegergy/dotfiles/master/install.sh | sh'
#
set -x

PACKAGES="vim \
	git \
	rsync \
    python \
    zsh \
	htop \
	zip unzip gzip tar\
	tmux \
	wget curl"

if [ "$(id -u)" != "0" ]; then
    SUDO='sudo'
else
    SUDO=''
fi

if A="$( which apt-get )" 2> /dev/null;
then
	echo "Debian based, installing packages"
	$SUDO apt-get update && \ 
	$SUDO apt-get install -y $PACKAGES && \ 
	$SUDO apt-get -y autoremove
else if A="$( which pacman )" 2> /dev/null;
then
	echo "Arch based, installing packages"
	$SUDO pacman -Syy && \ 
	$SUDO pacman -Syy $PACKAGES
fi
fi

cd /tmp
git clone https://github.com/antoinegergy/dotfiles.git
cd dotfiles
./run.sh
cd $HOME
rm -rf /tmp/dotfiles
