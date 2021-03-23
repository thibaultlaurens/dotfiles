#!/usr/bin/env/bash

echo "installing emacs.."
DF_EMACS_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

if [[ $(uname) == "Darwin" ]]; then
    brew tap d12frosted/emacs-plus
    brew install emacs-plus
    ln -s /usr/local/Cellar/emacs-plus/*/Emacs.app/ /Applications/

elif [[ $(uname) == "Linux" ]]; then
    sudo snap install emacs --classic
fi

# Clone doom emacs repo
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d

# Link config
ln -fs "$DF_EMACS_DIR/.doom.d" "$HOME/.doom.d"

# Install and setup doom emacs
~/.emacs.d/bin/doom install

# Show potential issues on the system
~/.emacs.d/bin/doom doctor

echo "done"
