#!/usr/bin/env bash

# Install xcode cli
xcode-select --install

# Apply os hardening
source "$HOME/.install/harden.sh"

# Install packages
source "$HOME/.install/brew.sh"

# Setup zsh and gpg
source "$HOME/.install/zsh.sh"
source "$HOME/.install/gpg.sh"

# Install programming languages
source "$HOME/.install/go.sh"
source "$HOME/.install/python.sh"
source "$HOME/.install/node.sh"

# Install emacs
source "$HOME/.install/emacs.sh"
