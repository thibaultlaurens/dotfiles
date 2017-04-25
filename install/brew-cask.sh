#!/usr/bin/env bash

echo "installing homebrew cask..."

brew tap caskroom/cask
brew tap caskroom/fonts

apps=(
    adapter
    android-file-transfer
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
    mongodb-compass
    postman
    robomongo
    simplenote
    skype
    slack
    sourcetree
    spectacle
    transmission
    virtualbox
    vlc
)

echo "installing apps..."
brew cask install "${apps[@]}"
