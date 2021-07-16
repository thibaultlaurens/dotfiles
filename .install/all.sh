#!/usr/bin/env bash

echo "running install script.."

# Install xcode cli
xcode-select --install

# Install packages
source "$HOME/.install/brew.sh"

# Apply os hardening and preferences
source "$HOME/.install/macos_harden.sh"
source "$HOME/.install/macos_prefs.sh"

# Install programming languages
source "$HOME/.install/go.sh"
source "$HOME/.install/python.sh"
source "$HOME/.install/node.sh"

# Install docker
source "$HOME/.install/docker.sh"

# Install emacs
source "$HOME/.install/emacs.sh"

# Install alacritty
source "$HOME/.install/alacritty.sh"

# Install starship prompt and zsh
curl -fsSL https://starship.rs/install.sh | bash
source "$HOME/.install/zsh.sh"

echo "all done"
