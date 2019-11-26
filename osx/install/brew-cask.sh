#!/usr/bin/env bash

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

apps=(
    adobe-creative-cloud
    adapter
    docker
    simplenote
    firefox-developer-edition
    font-source-code-pro
    font-source-code-pro-for-powerline
    google-backup-and-sync
    google-chrome
    iterm2
    itsycal
    keepingyouawake
    macdown
    menumeters
    simplenote
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
