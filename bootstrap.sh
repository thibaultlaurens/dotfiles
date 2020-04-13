#!/bin/bash

export GIT_REPOS="$HOME/git/thibault"
export DOTFILES="$GIT_REPOS/dotfiles"

if [[ $(uname) == "Darwin" ]]; then
    echo "seting up darwin..."
    source .darwin
elif [[ $(uname) == "Linux" ]]; then
    echo "seting up linux..."
    sudo apt update && sudo apt install git
fi

# clone dotfiles repo
mkdir "$GIT_REPOS" && cd "$GIT_REPOS" || exit
git clone https://github.com/thibaultlaurens/dotfiles.git && cd dotfiles || exit

# install pkgs and apps
if [[ $(uname) == "Darwin" ]]; then
    source pkg/brew.sh
    source pkg/brew_cask.sh
elif [[ $(uname) == "Linux" ]]; then
    source pkg/apt.sh
fi

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

# set default shell for current and root user
chsh -s /usr/local/bin/bash
sudo chsh -s /usr/local/bin/bash

# shellcheck source=bash/.bash_profile
source "$HOME/.bash_profile"

# Enable firewall on linux
if [[ $(uname) == "Linux" ]]; then
    sudo ufw enable
fi

echo "all done"
