#!/usr/bin/env bash

echo "installing alacritty.."
DF_ALACRITTY_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

if [[ $(uname) == "Darwin" ]]; then
    brew install alacritty

elif [[ $(uname) == "Linux" ]]; then
    cargo install alacritty

    # Add the desktop entry
    ln -fs "$DF_ALACRITTY_DIR/alacritty.desktop" \
        "$HOME/.local/share/applications/alacritty.desktop"
    ln -fs "$DF_ALACRITTY_DIR/alacritty-term.svg" \
        "$HOME/.local/share/applications/alacritty-term.svg"
    sudo update-desktop-database
fi

echo "done"
