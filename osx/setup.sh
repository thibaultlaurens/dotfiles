#!/usr/bin/env bash

echo "setting up osx.."
DF_OSX_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Install xcode cli
xcode-select --install

# Install packages and apps
source "$DF_OSX_DIR/brew.sh"
source "$DF_OSX_DIR/brew_cask.sh"

# Whitelist the upgraded shell
echo /usr/local/bin/bash | sudo tee -a /etc/shells

# Set default shell for current and root user
chsh -s /usr/local/bin/bash
sudo chsh -s /usr/local/bin/bash

# Apply os preferences and hardening
source "$DF_OSX_DIR/preferences.sh"
source "$DF_OSX_DIR/hardening.sh"

# Link Iterm2 config
ln -fs "$DF_OSX_DIR/iterm/com.googlecode.iterm2.plist" \
    "$HOME/Library/Preferences/com.googlecode.iterm2.plist"

# Link Menumeters config
ln -fs "$DF_OSX_DIR/menumeters/com.ragingmenace.MenuMeters.plist" \
    "$HOME/Library/Preferences/com.ragingmenace.MenuMeters.plist"