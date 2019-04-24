#!/usr/bin/env bash

apps=(
    chromium
    simplenote
    slack --classic
    transmission --beta --jailmode
    vlc
)

echo "installing apps..."
sudo snap install "${apps[@]}"
