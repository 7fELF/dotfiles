#!/bin/bash
set -ex

DOTFILES_FOLDER="$PWD/$(dirname "$0")"
LN="ln -sf"

# Setup themes folder
# Flatabulous is NOT compatible with GTK 3.20
# so it's broken on Ubuntu 16.10 (for now)
rm -rf "$HOME/.themes"
$LN "$DOTFILES_FOLDER/themes" "$HOME/.themes"

# Setup the icons folder
rm -rf "$HOME/.icons"
$LN "$DOTFILES_FOLDER/icons" "$HOME/.icons"

# Install a few packages
PACKAGES=(zsh terminator redshift vlc firefox)
sudo apt-get install -y "${PACKAGES[@]}"

# Set zsh default shell
sudo chsh "$USER" -s "$(which zsh)"

# Avoid breaking the oh-my-zsh install script
rm -rf "$HOME/.zshrc"

echo "Installing oh-my-zsh"
wget -qO- "https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh" | sh

# Get our zshrc back
$LN "$DOTFILES_FOLDER/zshrc"              "$HOME/.zshrc"

# Install powerline fonts
# TODO: use a submodule for that
rm -rf "$HOME/.fonts"
mkdir -p "$HOME/.fonts"
cd "$HOME/.fonts"
git clone https://github.com/powerline/fonts.git

# Load my dconf dump
dconf load / < "$DOTFILES_FOLDER/dconf.ini"

# Set a Wallpaper
WALLPAPER_URL="https://archive-media-1.nyafuu.org/wg/image/1473/13/1473131556085.jpg"
wget "$WALLPAPER_URL" -O "$HOME/w.jpg"
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/w.jpg"

