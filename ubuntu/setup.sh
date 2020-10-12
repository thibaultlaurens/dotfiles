#!/usr/bin/env bash

echo "setting up ubuntu.."
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Install packages
source "$DIR/apt.sh"

# Enable firewall
sudo ufw enable

# Link Rxvt config
ln -fs "$DIR/urxvt/.Xresources" "$HOME/.Xresources"
ln -fs "$DIR/urxvt/.urxvt" "$HOME/.urxvt"

# Link Rxvt custom icon
ln -fs "$DIR/urxvt/rxvt-unicode.desktop" \
    "$HOME/.local/share/applications/rxvt-unicode.desktop"
ln -fs "$DIR/urxvt/rxvt-unicode.png" \
    "$HOME/.local/share/applications/rxvt-unicode.png"
