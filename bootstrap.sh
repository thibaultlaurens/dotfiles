#!/usr/bin/env bash

echo "seting up ..."

# Instal brew and brew-cask apps
source install/brew.sh
source install/brew-cask.sh

# Setup node env
source install/npm.sh

# Symlink everything
source symlink.sh

echo "all done"
