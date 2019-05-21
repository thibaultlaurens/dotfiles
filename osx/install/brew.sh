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
    tree
    unrar
    vim
    watch
    wget
    z
)

echo "installing brew packages..."
brew install "${packages[@]}"

# Install tern binary for emacs terminal
npm install -g tern

# Install vmd binary for emacs markdown preview
npm install -g vmd

# whitelist new bash
ln -fs ${HOME}/git/thibault/dotfiles/shell/shells /etc/shells

# set default shell for current and root user
chsh -s /usr/local/bin/bash
sudo chsh -s /usr/local/bin/bash

# Remove outdated versions from the cellar
echo "cleaning up..."
brew cleanup
