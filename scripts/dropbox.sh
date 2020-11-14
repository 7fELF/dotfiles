#!/bin/bash
set -ex

# Install Dropbox

# Add repo
sudo bash -c 'echo "deb http://linux.dropbox.com/ubuntu cosmic main" > /etc/apt/sources.list.d/dropbox.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E

# Install
sudo apt update
sudo apt install -y dropbox python3-gpg

echo 'y' | env -i dropbox start -i
dropbox stop
dropbox start

# Close restart notification
pkill update-notifier || true
