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
brew tap homebrew/dupes
brew tap Homebrew/bundle

apps=(
    android-platform-tools
    ansible
    bash
    bash-completion
    diff-so-fancy
    elixir
    emacs
    erlang-r18
    git
    go
    htop
    hub
    openssh
    openssl
    python
    supervisor
    tree
    vim
    watch
)

echo "installing packages..."
brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup
