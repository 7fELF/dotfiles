#!/bin/bash
set -ex

DOTFILES_FOLDER="$(dirname "$(realpath "$0")")"
LN="ln -sf"

function link_folder {
  rm -rf "$HOME/.$1"
  $LN "$DOTFILES_FOLDER/$1" "$HOME/.$1"
}

# Setup the icons folder
link_folder icons

# Setup the fonts folder
link_folder fonts

# VLC Settings
link_folder config/vlc

# Gtk3 settings (dark mode)
link_folder "config/gtk-3.0"

# Home folders
mkdir -p "$HOME/Downloads" "$HOME/repos" "$HOME/Videos"
$LN "$DOTFILES_FOLDER/config/user-dirs.dirs" "$HOME/.config/user-dirs.dirs"
rm -d -f "$HOME/Desktop" "$HOME/Music" "$HOME/Public" "$HOME/Templates" "$HOME/Pictures" "$HOME/Documents"

"$DOTFILES_FOLDER/scripts/dropbox.sh"

# PPA
sudo add-apt-repository --yes ppa:git-core/ppa
sudo add-apt-repository --yes ppa:phoerious/keepassxc

sudo apt-get update

# Install a few packages
PACKAGES=(
  zsh
  terminator
  redshift
  vlc
  mpv
  firefox
  vim
  vim-gtk
  youtube-dl
  ffmpeg
  handbrake-cli
  keepassxc
  xdotool
  gparted
  screenfetch
  chrome-gnome-shell
  gnome-tweak-tool
  dconf-editor
  python3-pip
  wireguard-tools
  materia-gtk-theme
  xclip xsel
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

gnome_extentions_dir="$HOME/.local/share/gnome-shell/extensions/"
function install_extention {
  mkdir  -p "$gnome_extentions_dir"

  local zipfile="$(mktemp).zip"
  wget "https://extensions.gnome.org/extension-data/$1.shell-extension.zip" -O "$zipfile"

  local tmpdir="$(mktemp -d)"
  unzip "$zipfile" -d "$tmpdir"

  local folder_name="$(jq .uuid "$tmpdir/metadata.json" --raw-output)"

  # TODO: if not installed already
  mv "$tmpdir" "$gnome_extentions_dir/$folder_name"
}

GNOME_EXTENTIONS=(
  # WIP: needs more testing
  # "VitalsCoreCoding.com.v31"
  # "unitehardpixel.eu.v40"
  # "user-themegnome-shell-extensions.gcampax.github.com.v40"
)
for ext in "${GNOME_EXTENTIONS[@]}";
do
  install_extention "$ext"
done


# Load my dconf dump
dconf load / < "$DOTFILES_FOLDER/dconf.ini"

# Set a Wallpaper
WALLPAPER_URL="https://source.unsplash.com/collection/3355701/1920x1080"
# https://source.unsplash.com/collection/3355701/1920x1080/daily
if [ ! -f "$HOME/w.jpg" ]; then
  wget "$WALLPAPER_URL" -O "$HOME/w.jpg"
fi
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/w.jpg"
gsettings set org.gnome.settings-daemon.plugins.background active true



