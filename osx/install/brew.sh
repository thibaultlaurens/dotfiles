#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
 echo "installing homebrew..."
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

sudo chown -R $(whoami) $(brew --prefix)/*

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Check for potential problems
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
    docker-completion
    findutils
    fzf                                 
    git
    gnu-sed
    graphviz
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
