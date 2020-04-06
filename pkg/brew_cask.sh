#!/usr/bin/env bash

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

apps=(
    adobe-creative-cloud
    adapter
    firefox
    font-source-code-pro
    font-source-code-pro-for-powerline
    google-backup-and-sync
    iterm2
    itsycal
    keepassxc
    keepingyouawake
    macdown
    menumeters
    notion
    skype
    slack
    spectacle
    tor-browser
    transmission
    virtualbox
    vlc
)

echo "installing homebrew apps..."
brew cask install "${apps[@]}"


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

echo "installing quick-look packages"
brew cask install "${packages[@]}"
