#!/bin/bash
set -e
# set -x

DOTFILES_FOLDER="$(dirname "$(realpath "$0")")"

if [ ! -x "$(command -v apt-get)" ]; then
  echo "Can't install packages without apt"
  exit 1
fi

LN="ln -sf"

PACKAGES=(
  git
  curl wget
  vim
  rsync
  htop
  zip unzip
  gzip tar
  tmux
  httpie
  tree
  links
  shellcheck
  jq
  detox
  rename
  wireguard-tools
)


echo "Installing packages"
sudo apt-get install -y "${PACKAGES[@]}"

mkdir -p "$HOME/.config/terminator/"

DOTFILES=(
"vimrc"
"tmux.conf"
"zshrc"
"editorconfig"
"gitconfig"
"vim"
"selected_editor"
"ycm_extra_conf.py"
"ideavimrc"
"Xresources"
"config/terminator/config"
)

for file in "${DOTFILES[@]}"
do
  $LN "$DOTFILES_FOLDER/$file" "$HOME/.${file}"
  echo "Linked $DOTFILES_FOLDER/$file to $HOME/.${file}"
done

if [[ ! -f "$HOME/.vim/autoload" ]]
then
echo "Installing vim plug"

curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi


vim -E +PlugUpgrade +PlugClean! +PlugInstall +PlugUpdate +qall
