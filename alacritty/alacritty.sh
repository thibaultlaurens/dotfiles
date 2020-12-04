#!/usr/bin/env bash

echo "installing alacritty.."
DF_ALACRITTY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Clone the repo
git clone https://github.com/alacritty/alacritty.git "$HOME/alacritty"

if [[ $(uname) == "Darwin" ]]; then
    brew install alacritty
    
elif [[ $(uname) == "Linux" ]]; then
    # Check rust compiler
    rustup override set stable
    rustup update stable

    # Install dependencies
    sudo apt update && sudo apt install --no-install-recommends \
        cmake pkg-config libfreetype6-dev libfontconfig1-dev \
        libxcb-xfixes0-dev python3

    # Build
    cargo build --manifest-path="$HOME/alacritty/Cargo.toml" --release
    sudo cp "$HOME/alacritty/target/release/alacritty" /usr/local/bin

    # Link Desktop Entry
    ln -fs "$DF_ALACRITTY_DIR/alacritty.desktop" \
        "$HOME/.local/share/applications/alacritty.desktop"
    ln -fs "$DF_ALACRITTY_DIR/alacritty-term.svg" \
        "$HOME/.local/share/applications/alacritty-term.svg"
    sudo update-desktop-database
fi

# Manual pages
sudo mkdir -p /usr/local/share/man/man1
gzip -c "$HOME/alacritty/extra/alacritty.man" | \
    sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

# Bash completion
mkdir -p "$HOME/.bash_completion"
cp "$HOME/alacritty/extra/completions/alacritty.bash" \
    "$HOME/.bash_completion/alacritty"

# Terminfo
sudo tic -xe alacritty,alacritty-direct "$HOME/alacritty/extra/alacritty.info"

# Link config
mkdir -p "$HOME/.config/alacritty"
ln -fs "$DF_ALACRITTY_DIR/alacritty.yml" \
    "$HOME/.config/alacritty/alacritty.yml"

# Remove the repo
rm -rf "$HOME/alacritty"

echo "done"
