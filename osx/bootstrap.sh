#!/usr/bin/env bash

echo "seting up osx..."

# Instal brew and brew-cask apps
source install/brew.sh
source install/brew-cask.sh

# Setup emacs, node and go environment
source install/spacemacs.sh
source install/go.sh
source install/python.sh
source install/rust.sh

# Symlink everything
source symlink.sh

# Set custom os x defaults
source .osx

echo "all done"
