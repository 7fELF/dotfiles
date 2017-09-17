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

"$DOTFILES_FOLDER/scripts/dropbox.sh"

# keeagent PPA
sudo add-apt-repository --yes ppa:dlech/keepass2-plugins
# hh PPA
sudo add-apt-repository --yes ppa:ultradvorka/ppa
# nnn and googler PPA
sudo add-apt-repository --yes ppa:twodopeshaggy/jarun
# Handbrake PPA
sudo add-apt-repository --yes ppa:stebbins/handbrake-releases

sudo apt-get update

# Install a few packages
PACKAGES=(
  zsh
  terminator
  redshift
  vlc
  firefox
  vim-gtk
  python-pip
  youtube-dl
  ffmpeg
  handbrake-gtk
  handbrake-cli
  keepass2
  xdotool
  keepass2-plugin-keeagent
  flashplugin-installer
  hh
  netsurf-gtk
  uzbl
  nnn
  googler
  gparted
)

sudo apt-get install -y "${PACKAGES[@]}"

# Autostart redshift
mkdir -p "$HOME/.config/autostart/"
$LN "$DOTFILES_FOLDER/redshift.desktop" "$HOME/.config/autostart/"

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

# Load my dconf dump
dconf load / < "$DOTFILES_FOLDER/dconf.ini"

# Set a Wallpaper
WALLPAPER_URL="https://archive-media-1.nyafuu.org/wg/image/1473/13/1473131556085.jpg"
if [ ! -f "$HOME/w.jpg" ]; then
  wget "$WALLPAPER_URL" -O "$HOME/w.jpg"
fi
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/w.jpg"
gsettings set org.gnome.settings-daemon.plugins.background active true

# Remove devices from unity launcher
"$DOTFILES_FOLDER"/ubuntu_remove_devices_from_launcher.sh

firefox "about:accounts?action=signin"&
