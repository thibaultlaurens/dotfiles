#!/usr/bin/env bash

echo "setting up alacritty.."
ALACRITTY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Clone the repo
git clone https://github.com/alacritty/alacritty.git /tmp/alacritty
cd /tmp/alacritty

# Check rust compiler
rustup override set stable
rustup update stable

# Dependencies
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

# Build
cargo build --release

# Desktop Entry
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop

# Link Desktop Entry
ln -fs "$ALACRITTY_DIR/alacritty.desktop" \
    "$HOME/.local/share/applications/alacritty.desktop"
ln -fs "$ALACRITTY_DIR/alacritty-term.svg" \
    "$HOME/.local/share/applications/alacritty-term.svg"
sudo update-desktop-database

# Link config
mkdir -p "$HOME/.config/alacritty"
ln -fs "$ALACRITTY_DIR/alacritty.yml" \
    "$HOME/.config/alacritty/alacritty.yml"

# Manual pages
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

# Bash completion
mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
