#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ $(uname) == "Darwin" ]]; then
    echo "setting up osx.."

    # Install xcode cli
    xcode-select --install

    # Install packages and apps
    source "$DIR/osx/brew.sh"
    source "$DIR/osx/brew_cask.sh"

    # Apply preferences and security measures
    source "$DIR/osx/preferences.sh"
    source "$DIR/osx/hardening.sh"

elif [[ $(uname) == "Linux" ]]; then
    echo "setting up ubuntu.."

    # Install packages
    source "$DIR/ubuntu/apt.sh"

    # Enable firewall
    sudo ufw enable
fi

# Install programming languages
source "$DIR/lang/go.sh"
source "$DIR/lang/node.sh"
source "$DIR/lang/python.sh"
source "$DIR/lang/rust.sh"

# Install docker
source "$DIR/docker/docker.sh"

# Install spacemacs
source "$DIR/emacs/install.sh"

# Symlink everything
source "$DIR/symlink.sh"

# Set default shell for current and root user
chsh -s /usr/local/bin/bash
sudo chsh -s /usr/local/bin/bash

# Reload bashrc
source "$HOME/.bashrc"

echo "all done"
