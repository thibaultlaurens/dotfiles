#!/usr/bin/env bash

echo "setting up ubuntu.."
DF_UBUNTU_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# Install packages
source "$DF_UBUNTU_DIR/apt.sh"

# Install fonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts "$HOME/nerd-fonts"
"$HOME/nerd-fonts/install.sh" SourceCodePro
rm -rf "$HOME/nerd-fonts"

# Enable firewall
sudo ufw enable
