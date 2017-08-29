#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
 echo "installing homebrew..."
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Check for potential problems
brew doctor

# Add more sources
brew tap Homebrew/bundle

echo "installing packages..."
apps=(
    ag
    ansible
    bash
    bash-completion
    brew-cask-completion
    coreutils
    diff-so-fancy
    docker-completion
    dvm
    elixir
    erlang-r18
    findutils
    fzf                                 #
    git
    gnu-sed --with-default-names
    htop
    httpie
    hub
    icdiff
    imagemagick
    ispell
    lnav                                 # log file viewer
    markdown
    moreutils
    openssh
    openssl
    ranger                               # console file manager
    supervisor
    tig                                  # text-mode interface for git
    tree
    unrar
    vagrant-completion
    vim
    watch
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
echo "cleaning up..."
brew cleanup
