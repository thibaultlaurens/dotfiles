#!/usr/bin/env bash

echo "installing alacritty.."

if [[ $(uname) == "Darwin" ]]; then
    brew install alacritty

elif [[ $(uname) == "Linux" ]]; then
    cargo install alacritty

    # Add the desktop entry
    ln -fs "$HOME/.install/alacritty.desktop" \
        "$HOME/.local/share/applications/alacritty.desktop"
    ln -fs "$HOME/.install/alacritty-term.svg" \
        "$HOME/.local/share/applications/alacritty-term.svg"
    sudo update-desktop-database
fi

echo "done"
