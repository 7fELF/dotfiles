#!/bin/sh
set +x
PACKAGES="vim \
	git \
	rsync \
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

git pull origin master

rsync   --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude "install.sh" \
	--exclude "README.md" -avh --no-perms src/ $HOME;

mkdir -p  ~/.vim/bundle/
rm -Rf $HOME/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
