#!/bin/bash

echo "installing rust..."

# Install rust and source it
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

# Install racer (auto-completion tool)
rustup toolchain add nightly
cargo +nightly install racer

# Install rustfmt
cargo +nightly install rustfmt --force

echo "done"
