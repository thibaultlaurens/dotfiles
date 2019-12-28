#!/usr/bin/env bash

apps=(
    firefox
    slack --classic
    transmission --beta --jailmode
    vlc
)

echo "installing snaps..."
sudo snap install "${apps[@]}"
