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
    font-sauce-code-pro-nerd-font
    google-backup-and-sync
    iterm2
    keybase
    ledger-live
    little-snitch
    macdown
    macpass
    menumeters
    micro-snitch
    onyx
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
