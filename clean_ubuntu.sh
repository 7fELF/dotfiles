#!/bin/bash

PACKAGES=(
  gnome-calendar
  gnome-sudoku
  gnome-mahjongg
  gnome-mines
  aisleriot
  rhythmbox
  "libreoffice-*"
  totem
  thunderbird
  cheese
  transmission-gtk
  transmission-common
  usb-creator-gtk
  "hyphen-*"
  "mythes-*"
  "openoffice*"
  unity-lens-music
  unity-lens-video
  unity-lens-files
  unity-lens-photos
  unity-webapps-common
  "remmina-*"
)

sudo apt autoremove -y "${PACKAGES[@]}"
