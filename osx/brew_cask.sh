#!/usr/bin/env/bash

apps=(
    adapter
    adobe-creative-cloud
    appcleaner
    balenaetcher
    bitwarden
    firefox
    font-sauce-code-pro-nerd-font
    google-backup-and-sync
    handshaker
    keepassxc
    little-snitch
    macdown
    menumeters
    micro-snitch
    onyx
    protonmail-bridge
    protonvpn
    proxyman
    spectacle
    standard-notes
    tableplus
    tor-browser
    transmission
    virtualbox
    vlc
)

echo "installing apps.."
brew install --cask "${apps[@]}"
echo "done"

ql_packages=(
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
brew install --cask "${ql_packages[@]}"
echo "done"
