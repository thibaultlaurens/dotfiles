#!/usr/bin/env bash

echo "installing homebrew cask..."

brew tap caskroom/cask
brew tap caskroom/fonts

echo "installing apps..."

apps=(
    adapter
    android-file-transfer
    android-platform-tools
    appcleaner
    daisydisk
    dash
    docker
    evernote
    firefox
    font-hack
    google-chrome
    google-drive
    iterm2
    itsycal
    keepingyouawake
    macdown
    mongodb-compass
    postman
    robomongo
    simplenote
    skype
    slack
    sourcetree
    spectacle
    transmission
    vagrant
    vagrant-manager
    virtualbox
    vlc
)
brew cask install "${apps[@]}"

echo "installing quick-look packages"

packages=(
    qlcolorcode
    qlstephen
    qlmarkdown
    quicklook-json
    qlprettypatch
    quicklook-csv
    betterzipql
    qlimagesize
    suspicious-package
    qlvideo
)
brew cask install "${packages[@]}"
