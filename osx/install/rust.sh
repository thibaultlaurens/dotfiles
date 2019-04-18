#!/usr/bin/env bash

# install rust and source it
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

# install racer (auto-completion tool)
rustup toolchain add nightly
cargo +nightly install racer

# install rustfmt
cargo +nightly install rustfmt --force
