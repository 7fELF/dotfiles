#/bin/sh
set -x

DOTFILES_FOLDER="$PWD/$(dirname $0)"
LN="ln -sf"

$LN $DOTFILES_FOLDER/vimrc              $HOME/.vimrc
$LN $DOTFILES_FOLDER/tmux.conf          $HOME/.tmux.conf
$LN $DOTFILES_FOLDER/zshrc              $HOME/.zshrc
$LN $DOTFILES_FOLDER/editorconfig       $HOME/.editorconfig
$LN $DOTFILES_FOLDER/gitconfig          $HOME/.gitconfig
$LN $DOTFILES_FOLDER/vim                $HOME/.vim
$LN $DOTFILES_FOLDER/selected_editor    $HOME/.selected_editor
$LN $DOTFILES_FOLDER/ycm_extra_conf.py  $HOME/.ycm_extra_conf.py

mkdir -p $HOME/.config/terminator/
$LN $DOTFILES_FOLDER/config/terminator/config $HOME/.config/terminator/config

mkdir -p  ~/.vim/bundle/
rm -Rf $HOME/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
reset
