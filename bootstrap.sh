#!/usr/bin/env bash

if [[ $(uname -s) == Darwin ]]; then
    echo "seting up osx..."
    source .osx
else
    echo "seting up ubuntu..."
    sudo apt update
    sudo apt install git
fi

# clone dotfiles repo
mkdir git/thibault && cd git/thibault
git clone https://github.com/thibaultlaurens/dotfiles.git && cd dotfiles

# install pkgs and apps
if [[ $(uname -s) == Darwin ]]; then
    source pkg/brew.sh
    source pkg/brew_cask.sh
else
    source pkg/apt.sh
    source pkg/snap.sh
fi

# set default shell for current and root user
chsh -s /usr/local/bin/bash
sudo chsh -s /usr/local/bin/bash

# install programming languages
source lang/go.sh
source lang/node.sh
source lang/python.sh
source lang/rust.sh

# install docker
source pkg/docker.sh

# install spacemacs
source emacs/install.sh

# Symlink everything
source symlink.sh

echo "all done"
