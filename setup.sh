#!/usr/bin/env bash

echo "setting up environment.."
DF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# Link .config directory
rm -r .config
ln -s "$DF_DIR/.config" "${HOME}/.config"

# OS related setup
if [[ $(uname) == "Darwin" ]]; then
    # Install xcode cli
    xcode-select --install

    # Install packages
    source "$DF_DIR/install/brew.sh"

    # Apply os hardening and preferences
    source "$DF_DIR/install/macos_harden.sh"
    source "$DF_DIR/install/macos_prefs.sh"

elif [[ $(uname) == "Linux" ]]; then
    # Install packages
    source "$DF_DIR/install/apt.sh"

    # Install fonts
    git clone --depth 1 https://github.com/ryanoasis/nerd-fonts "$HOME/nerd-fonts"
    "$HOME/nerd-fonts/install.sh" SourceCodePro
    rm -rf "$HOME/nerd-fonts"

    # Enable firewall
    sudo ufw enable
fi

# Install programming languages
source "$DF_DIR/install/go.sh"
source "$DF_DIR/install/python.sh"
source "$DF_DIR/install/node.sh"
source "$DF_DIR/install/rust.sh"

# Install docker
source "$DF_DIR/install/docker.sh"

# Install emacs
source "$DF_DIR/install/emacs.sh"

# Install alacritty
source "$DF_DIR/install/alacritty.sh"

# Install starship prompt and zsh
curl -fsSL https://starship.rs/install.sh | bash
source "$DF_DIR/install/zsh.sh"

# Link zsh config file
ln -s "$DF_DIR/.zshrc" "${HOME}/.zshrc"

echo "all done"
