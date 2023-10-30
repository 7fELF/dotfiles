#!/bin/bash
set -ex

DOTFILES_FOLDER="$(dirname "$(realpath "$0")")"
LN="ln -sf"

function link_folder {
  rm -rf "$HOME/.$1"
  $LN "$DOTFILES_FOLDER/$1" "$HOME/.$1"
}

# Setup themes folder
# Flatabulous is NOT compatible with GTK 3.20
# so it's broken on Ubuntu 16.10 (for now)
link_folder themes

# Setup the icons folder
link_folder icons

# Setup the fonts folder
link_folder fonts

# Copy Keepass default configuration
# not using a symlink because Keepass is adding things in this file
rm -rf "$HOME/.config/KeePass"
cp -r "$DOTFILES_FOLDER/config/KeePass" "$HOME/.config/"

# VLC Settings
link_folder config/vlc

# Gtk3 settings (dark mode)
link_folder "config/gtk-3.0"

# Home folders
mkdir -p "$HOME/Downloads" "$HOME/repos" "$HOME/Videos"
$LN "$DOTFILES_FOLDER/config/user-dirs.dirs" "$HOME/.config/user-dirs.dirs"
rm -d -f "$HOME/Desktop" "$HOME/Music" "$HOME/Public" "$HOME/Templates" "$HOME/Pictures" "$HOME/Documents"


sudo apt-get update

# Install a few packages
PACKAGES=(
  zsh
  xsel
  terminator
  vlc
  firefox
  vim
  xdotool
  gparted
)

sudo apt-get install -y "${PACKAGES[@]}"

# Set zsh default shell
sudo chsh "$USER" -s "$(which zsh)"

# Avoid breaking the oh-my-zsh install script
rm -rf "$HOME/.zshrc"
export SHELL
SHELL="$(which zsh)"

echo "Installing oh-my-zsh"
wget -qO- "https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh" | sh

# Get our zshrc back
$LN "$DOTFILES_FOLDER/zshrc" "$HOME/.zshrc"


