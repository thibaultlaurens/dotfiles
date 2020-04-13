#!/bin/bash

export GIT_REPOS="$HOME/git/thibault"
export DOTFILES="$GIT_REPOS/dotfiles"

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

# block incoming connections
if [[ $(uname) == "Darwin" ]]; then
    sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
    sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1
elif [[ $(uname) == "Linux" ]]; then
    sudo ufw enable
fi

if [[ $(uname) == "Darwin" ]]; then
    echo "setting up mac os defaults..."
    source osx.sh
fi

echo "all done"
