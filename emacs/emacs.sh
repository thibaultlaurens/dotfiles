#!/usr/bin/env/bash

echo "installing emacs.."
DF_EMACS_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

if [[ $(uname) == "Darwin" ]]; then
    brew tap d12frosted/emacs-plus
    brew install emacs-plus
    ln -s /usr/local/Cellar/emacs-plus/*/Emacs.app/ /Applications/

elif [[ $(uname) == "Linux" ]]; then
    snap install emacs --classic
fi

# Clone doom emacs repo
git clone https://github.com/hlissner/doom-emacs ~/doom-emacs

# Link config
ln -nfs "$DF_EMACS_DIR/.doom.d" "$HOME/.doom.d"

# Install and setup doom emacs 
~/doom-emacs/bin/doom install

# Show potential issues on the system
~/doom-emacs/bin/doom doctor

echo "done"
