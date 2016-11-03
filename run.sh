#/bin/sh
set -x

ln -s $HOME/dotfiles/vimrc		$HOME/.vimrc
ln -s $HOME/dotfiles/tmux.config	$HOME/.tmux.conf
ln -s $HOME/dotfiles/zshrc		$HOME/.zshrc
ln -s $HOME/dotfiles/editorconfig	$HOME/.editorconfig
ln -s $HOME/dotfiles/gitconfig 		$HOME/.gitconfig
ln -s $HOME/dotfiles/vim		$HOME/.vim
mkdir -p $HOME/.config/terminator/
ln -s $HOME/dotfiles/config/terminator	$HOME/.config/terminator/config

mkdir -p  ~/.vim/bundle/
rm -Rf $HOME/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
