#!/usr/bin/env bash

echo "setting up ubuntu.."
DF_UBUNTU_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Install packages
source "$DF_UBUNTU_DIR/apt.sh"

# Install fonts
source "$DF_UBUNTU_DIR/fonts.sh"

# Enable firewall
sudo ufw enable

# Link Rxvt config
ln -fs "$DF_UBUNTU_DIR/urxvt/.Xresources" "$HOME/.Xresources"
ln -nfs "$DF_UBUNTU_DIR/urxvt/.urxvt/" "$HOME/.urxvt"

# Link Rxvt custom icon
ln -fs "$DF_UBUNTU_DIR/urxvt/rxvt-unicode.desktop" \
    "$HOME/.local/share/applications/rxvt-unicode.desktop"
ln -fs "$DF_UBUNTU_DIR/urxvt/rxvt-unicode.png" \
    "$HOME/.local/share/applications/rxvt-unicode.png"
