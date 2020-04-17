#!/bin/bash

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

apps=(
    adapter
    adobe-creative-cloud
    appcleaner
    bitwarden
    firefox
    font-source-code-pro
    font-source-code-pro-for-powerline
    google-backup-and-sync
    iterm2
    itsycal
    keepassxc
    keepingyouawake
    ledger-live
    macdown
    menumeters
    notion
    protonvpn
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
    qlmarkdown
    qlprettypatch
    qlstephen
    qlvideo
    quicklook-csv
    quicklook-json
    suspicious-package
)

echo "installing quick-look packages"
brew cask install "${packages[@]}"
