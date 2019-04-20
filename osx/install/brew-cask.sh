#!/usr/bin/env bash

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions
brew tap theseal/blank-screensaver

apps=(
    adobe-creative-cloud
    adapter
    appcleaner
    blank-screensaver
    chromium
    docker
    simplenote
    firefox-developer-edition
    font-source-code-pro
    font-source-code-pro-for-powerline
    google-backup-and-sync
    iterm2
    itsycal
    keepingyouawake
    macdown
    yujitach-menumeters
    simplenote
    skype
    slack
    spectacle
    tor-browser
    transmission
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
