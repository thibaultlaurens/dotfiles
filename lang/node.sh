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
    diff-so-fancy     # better diff                   - used by git
    eslint            # syntax checker                - used by emacs
    import-js         # automatic dependencies import - used by emacs
    prettier          # code formatter                - used by emacs
    tern              # js analyzer                   - used by emacs
    vmd               # preview markdown files        - used by emacs
)

sudo npm install -g "${packages[@]}"
