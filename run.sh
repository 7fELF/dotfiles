#!/bin/sh
set -x

git pull origin master

rsync   --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude "install.sh" \
	--exclude "README.md" -avh --no-perms src/ $HOME;

mkdir -p  ~/.vim/bundle/
rm -Rf $HOME/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
