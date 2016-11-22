#/bin/sh
set -x

DOTFILES_FOLDER="$PWD/$(dirname $0)"

ln -sf $DOTFILES_FOLDER/vimrc		    $HOME/.vimrc
ln -sf $DOTFILES_FOLDER/tmux.conf	    $HOME/.tmux.conf
ln -sf $DOTFILES_FOLDER/zshrc		    $HOME/.zshrc
ln -sf $DOTFILES_FOLDER/editorconfig	    $HOME/.editorconfig
ln -sf $DOTFILES_FOLDER/gitconfig        $HOME/.gitconfig
ln -sf $DOTFILES_FOLDER/vim              $HOME/.vim
ln -sf $DOTFILES_FOLDER/selected_editor  $HOME/.selected_editor

mkdir -p $HOME/.config/terminator/
ln -sf $DOTFILES_FOLDER/config/terminator/config $HOME/.config/terminator/config

mkdir -p  ~/.vim/bundle/
rm -Rf $HOME/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
