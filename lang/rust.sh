#!/usr/bin/env/bash

echo "installing rust..."

# Install or update rust via rustup
: "${CARGO_ROOT:=$HOME/.cargo}"
if [ ! -d "$CARGO_ROOT" ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
    rustup update
fi

# Configure PATH for the current shell
source "$HOME/.cargo/env"

packages=(
    'exa'       # A modern replacement for ls
    'procs'     # A modern replacement for ps
    'du-dust'   # A modern replacement for du
    'bandwhich' # Terminal bandwidth utilization tool
    'fd-find'   # A modern replacement for find
    'tealdeer'  # A very fast implementation of tldr
)

echo "installing rust packages.."
cargo install -f "${packages[@]}"

echo "done"
