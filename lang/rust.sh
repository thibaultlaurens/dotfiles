#!/bin/bash

echo "installing python..."

# install rust and source it
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# shellcheck disable=SC1090
source "$HOME/.cargo/env"

# install racer (auto-completion tool)
rustup toolchain add nightly
cargo +nightly install racer

# install rustfmt
cargo +nightly install rustfmt --force
