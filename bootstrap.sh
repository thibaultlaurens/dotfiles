#!/usr/bin/env bash

if [[ `uname` == "Darwin" ]]; then
    echo "seting up darwin..."
    source .darwin
elif [[ `uname` == "Linux" ]]; then
    echo "seting up linux..."
    sudo apt update && sudo apt install git
fi

# clone dotfiles repo
mkdir git/thibault && cd git/thibault
git clone https://github.com/thibaultlaurens/dotfiles.git && cd dotfiles

# install pkgs and apps
if [[ `uname` == "Darwin" ]]; then
    source pkg/brew.sh
    source pkg/brew_cask.sh
elif [[ `uname` == "Linux" ]]; then
    source pkg/apt.sh
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

# Enable firewall on linux
if [[ `uname` == "Linux" ]]; then
    sudo ufw enable
fi

echo "all done"
