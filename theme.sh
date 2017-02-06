#!/bin/bash
set -ex

DOTFILES_FOLDER="$PWD/$(dirname "$0")"
LN="ln -sf"

# Setup themes folder
rm -rf "$HOME/.themes"
$LN "$DOTFILES_FOLDER/themes" "$HOME/.themes"

# Set the theme
# Not compatible with GTK 3.20 so it's broken on Ubuntu 16.10
gsettings set org.gnome.desktop.interface gtk-theme "Flatabulous"

# Setup the icons folder
rm -rf "$HOME/.icons"
$LN "$DOTFILES_FOLDER/icons" "$HOME/.icons"

# Set the icon theme
gsettings set org.gnome.desktop.interface icon-theme "Ultra-Flat"

# Install a few packages
PACKAGES=(zsh terminator redshift vlc firefox)
sudo apt-get install -y "${PACKAGES[@]}"

echo "Installing oh-my-zsh"
wget -qO- "https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh" | sh

# Set zsh default shell
sudo chsh "$USER" -s "$(which zsh)"

# Install powerline fonts
# TODO: use a submodule
rm -rf "$HOME/.fonts"
mkdir -p "$HOME/.fonts"
cd "$HOME/.fonts"
git clone https://github.com/powerline/fonts.git

dconf load / < "$DOTFILES_FOLDER/dconf.ini"

# Set a Wallpaper
WALLPAPER_URL="https://breakingmen.files.wordpress.com/2014/02/300002.jpg"
wget "$WALLPAPER_URL" -O "$HOME/w.jpg"
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/w.jpg"

