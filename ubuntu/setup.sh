#!/usr/bin/env bash

echo "setting up ubuntu.."
DF_UBUNTU_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Install packages
source "$DF_UBUNTU_DIR/apt.sh"

# Install fonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts "$HOME/nerd-fonts"
"$HOME/nerd-fonts/install.sh" SourceCodePro
rm -rf "$HOME/nerd-fonts"

# Enable firewall
sudo ufw enable

# Link Rxvt config
ln -fs "$DF_UBUNTU_DIR/urxvt/.Xresources" "$HOME/.Xresources"
ln -nfs "$DF_UBUNTU_DIR/urxvt/.urxvt/" "$HOME/.urxvt"

# Link Rxvt Desktop Entry
ln -fs "$DF_UBUNTU_DIR/urxvt/rxvt-unicode.desktop" \
    "$HOME/.local/share/applications/rxvt-unicode.desktop"
ln -fs "$DF_UBUNTU_DIR/urxvt/rxvt-unicode.png" \
    "$HOME/.local/share/applications/rxvt-unicode.png"
