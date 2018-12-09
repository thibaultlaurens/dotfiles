#!/usr/bin/env bash

echo "installing homebrew cask..."

brew tap caskroom/cask
brew tap caskroom/fonts

echo "installing apps..."

# todo: lightroom cc and ps cc
apps=(
    adobe-creative-cloud
    adapter
    android-file-transfer
    android-platform-tools
    appcleaner
    daisydisk
    dash
    docker
    simplenote
    firefox-developer
    font-hack
    google-chrome
    google-drive
    iterm2
    itsycal
    keepingyouawake
    macdown
    menumeters
    mongodb-compass
    postman
    rdm
    robo-3t
    simplenote
    skype
    slack
    spectacle
    tor
    transmission
    vlc
    zoomus
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
