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

brew tap homebrew/dupes
brew tap Homebrew/bundle

apps=(
    bash
    bash-completion
    git
    hub
    diff-so-fancy
    openssl
    openssh
    watch
    tree
    htop
    emacs
    vim
    ansible
    erlang
    elixir
    rebar3
    python
    go
    android-platform-tools
)

echo "installing packages..."
brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup
