#!/usr/bin/env bash

echo "installing caskroom..."
brew tap caskroom/cask
brew tap caskroom/fonts

apps=(
    vlc
    transmission
    spectacle
    sourcetree
    slack
    skype
    robomongo
    postman
    keepingyouawake
    itsycal
    iterm2
    font-hack
    google-drive
    google-chrome
    firefox
    evernote
    dropbox
    docker
    dash
    daisydisk
    box-sync
    atom
    appcleaner
    android-file-transfer
    adapter
)

echo "installing apps..."
brew cask install "${apps[@]}"
