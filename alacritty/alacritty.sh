#!/usr/bin/env bash

echo "installing alacritty.."
DF_ALACRITTY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ $(uname) == "Darwin" ]]; then
    brew install alacritty
    
elif [[ $(uname) == "Linux" ]]; then
    # Clone the repo
    git clone https://github.com/alacritty/alacritty.git "$HOME/alacritty"

    # Check rust compiler
    rustup override set stable
    rustup update stable

    # Dependencies
    sudo apt update && sudo apt install --no-install-recommends \
        cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev \
        python3

    # Build
    cargo build --release
    sudo cp "$HOME/alacritty/target/release/alacritty" /usr/local/bin

    # Manual pages
    sudo mkdir -p /usr/local/share/man/man1
    gzip -c "$HOME/alacritty/extra/alacritty.man" | \
        sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

    # Bash completion
    mkdir -p "$HOME/.bash_completion"
    cp "$HOME/alacritty/extra/completions/alacritty.bash" \
        "$HOME/.bash_completion/alacritty"

    # Remove repo
    rm -rf "$HOME/alacritty"

    # Link Desktop Entry
    ln -fs "$DF_ALACRITTY_DIR/alacritty.desktop" \
        "$HOME/.local/share/applications/alacritty.desktop"
    ln -fs "$DF_ALACRITTY_DIR/alacritty-term.svg" \
        "$HOME/.local/share/applications/alacritty-term.svg"
    sudo update-desktop-database
fi

# Link config
mkdir -p "$HOME/.config/alacritty"
ln -fs "$DF_ALACRITTY_DIR/alacritty.yml" \
    "$HOME/.config/alacritty/alacritty.yml"

echo "done"
