#!/bin/sh
#
#   'curl -sSL https://raw.githubusercontent.com/antoinegergy/dotfiles/master/install.sh | sh'
#   or:
#   'wget -qO- https://raw.githubusercontent.com/antoinegergy/dotfiles/master/install.sh | sh'
#
set +x

PACKAGES="vim \
	git \
	rsync \
    python \
    zsh \
	htop \
	zip unzip gzip tar\
	tmux \
	wget curl"

if A="$( which apt-get )" 2> /dev/null;
then
	echo "Debian based, installing packages"
	sudo apt-get update && \ 
	sudo apt-get install -y $PACKAGES && \ 
	sudo apt-get -y autoremove
else if A="$( which pacman )" 2> /dev/null;
then
	echo "Arch based, installing packages"
	sudo pacman -Syy && \ 
	sudo pacman -Syy $PACKAGES
fi
fi

cd /tmp
git clone https://github.com/antoinegergy/dotfiles.git
cd dotfiles
./run.sh
cd $HOME
rm -rf /tmp/dotfiles
