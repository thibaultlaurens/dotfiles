#!/usr/bin/env/bash

# Install nvm
echo "installing nvm.."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source "$HOME/.bashrc"

# Install node
echo "installing node.."
nvm install 14.2.0
nvm use 14.2.0

packages=(
    'diff-so-fancy'     # better diff                   - used by git
    'eslint'            # syntax checker                - used by emac
    'eslint-cli'        # syntax checker cli            - used by emacs
    'import-js'         # automatic dependencies import - used by emacs
    'prettier'          # code formatter                - used by emacs
    'tern'              # js analyzer                   - used by emacs
    'vmd'               # preview markdown files        - used by emacs
)

echo "installing node packages.."
npm install -g "${packages[@]}"
echo "done"
