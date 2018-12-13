#!/usr/bin/env bash

echo "installing homebrew cask..."

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions

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
    firefox-developer-edition
    font-hack
    font-source-code-pro
    google-chrome
    google-backup-and-sync
    iterm2
    itsycal
    keepingyouawake
    macdown
    yujitach-menumeters
    mongodb-compass
    postman
    robo-3t
    simplenote
    skype
    slack
    spectacle
    tor-browser
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
    suspicious-package
    qlvideo
)
brew cask install "${packages[@]}"
