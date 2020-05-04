#!/usr/bin/env/bash

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

apps=(
    adapter
    adobe-creative-cloud
    appcleaner
    balenaetcher
    bitwarden
    firefox
    font-source-code-pro
    font-source-code-pro-for-powerline
    google-backup-and-sync
    iterm2
    itsycal
    keepingyouawake
    keybase
    ledger-live
    macdown
    macpass
    menumeters
    protonmail-bridge
    protonvpn
    spectacle
    standard-notes
    tor-browser
    transmission
    virtualbox
    vlc
)

echo "installing apps.."
brew cask install "${apps[@]}"
echo "done"

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

echo "installing quick-look packages.."
brew cask install "${packages[@]}"
echo "done"
