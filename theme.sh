#/bin/sh
set -x

DOTFILES_FOLDER="$PWD/$(dirname $0)"
LN="ln -sf"

sudo apt-get install gnome-tweak-tool
mkdir $HOME/.themes
cd $HOME/.themes
git clone https://github.com/anmoljagetia/Flatabulous.git
gsettings set org.gnome.desktop.interface gtk-theme "Flatabulous"

$LN $DOTFILES_FOLDER/icons              $HOME/.icons

sudo apt-get install -y terminator
sudo chsh $USER -s $(which zsh)

gsettings set org.gnome.desktop.interface icon-theme "Ultra-Flat"
# cat ./dconf.dump | dconf load

wget https://breakingmen.files.wordpress.com/2014/02/300002.jpg -O $HOME/w.jpg
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/w.jpg"

mkdir -p $HOME/.fonts
cd $HOME/.fonts
git clone https://github.com/powerline/fonts.git
