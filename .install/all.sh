#!/usr/bin/env bash

# Apply os hardening
source "$HOME/.install/harden.sh"

# Install xcode cli
xcode-select --install

# Install packages
source "$HOME/.install/brew.sh"

# Setup shell and gpg
source "$HOME/.install/shell.sh"
source "$HOME/.install/gpg.sh"

# Install programming languages
source "$HOME/.install/go.sh"
source "$HOME/.install/python.sh"
source "$HOME/.install/node.sh"

# Install emacs
source "$HOME/.install/emacs.sh"
