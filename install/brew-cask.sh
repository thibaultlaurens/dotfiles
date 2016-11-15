#!/usr/bin/env bash

echo "installing caskroom..."
brew tap caskroom/cask
brew tap caskroom/fonts

apps=(
    adapter
    android-file-transfer
    appcleaner
    atom
    box-sync
    daisydisk
    dash
    docker
    dropbox
    evernote
    firefox
    font-hack
    google-chrome
    google-drive
    iterm2
    itsycal
    keepingyouawake
    postman
    robomongo
    skype
    slack
    sourcetree
    spectacle
    transmission
    vlc
)

echo "installing apps..."
brew cask install "${apps[@]}"
