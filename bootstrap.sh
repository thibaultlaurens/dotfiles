#!/bin/bash

export GIT_REPOS="$HOME/git/thibault"
export DOTFILES="$GIT_REPOS/dotfiles"

# clone dotfiles repo
mkdir "$GIT_REPOS" && cd "$GIT_REPOS" || exit
git clone https://github.com/thibaultlaurens/dotfiles.git && cd dotfiles || exit

# install pkgs and apps
if [[ $(uname) == "Darwin" ]]; then
    xcode-select --install
    source osx/brew.sh
    source osx/brew_cask.sh
elif [[ $(uname) == "Linux" ]]; then
    source ubuntu/apt.sh
fi

# install programming languages
source lang/go.sh
source lang/node.sh
source lang/python.sh
source lang/rust.sh

# install docker
source docker/docker.sh

# install spacemacs
source emacs/install.sh

# Symlink everything
source symlink.sh

# set default shell for current and root user
chsh -s /usr/local/bin/bash
sudo chsh -s /usr/local/bin/bash

# shellcheck source=bash/.bash_profile
source "$HOME/.bash_profile"

# final setup at os level
if [[ $(uname) == "Darwin" ]]; then
    source osx/preferences.sh
    source osx/hardening.sh
elif [[ $(uname) == "Linux" ]]; then
    sudo ufw enable
fi

echo "all done"
