#!/usr/bin/env bash

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

# Install emacs
source "$HOME/.install/emacs.sh"

# Setup zsh, install starship prompt and omz
chsh -s /usr/local/bin/zsh
curl -fsSL https://starship.rs/install.sh | bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
