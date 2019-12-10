#!/usr/bin/env bash

echo "installing node..."

if [[ $(uname -s) == Darwin ]]; then
    brew install node
else
    sudo apt update
    sudo apt install node
    sudo apt install npm
fi

echo "installing node packages..."

packages=(
    tern # used by terminal buffers in emacs
    diff-so-fancy # used by git config
    vmd # used by markdown preview in emacs
    eslint # on-the-fly syntax checking in emacs
    prettier # automatic code formatting in emacs
)

sudo npm install -g "${packages[@]}"
