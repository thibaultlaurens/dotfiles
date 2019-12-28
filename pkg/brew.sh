#!/usr/bin/env bash

# Ask for the admin password upfront
sudo -v

# Install homebrew if it's missing
if test ! $(which brew)
then
 echo "installing homebrew..."
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

sudo chown -R $(whoami) $(brew --prefix)/*

# Update homebrew, installed pacakges and check for issues
brew update
brew upgrade
brew doctor

# Add more sources
brew tap Homebrew/bundle

packages=(
    ag
    bash
    bash-completion
    brew-cask-completion
    coreutils
    ctop
    diff-so-fancy
    ffmpeg
    findutils
    fzf
    git
    gnu-indent
    gnu-sed
    graphviz
    grep
    gnu-tar
    gawk
    htop
    httpie
    hub
    icdiff
    ispell
    jq
    lnav
    markdown
    moreutils
    node
    openssh
    openssl
    tmux
    tree
    unrar
    vim
    watch
    wget
)

echo "installing brew packages..."
brew install "${packages[@]}"

# Remove outdated versions from the cellar
echo "cleaning up..."
brew cleanup
