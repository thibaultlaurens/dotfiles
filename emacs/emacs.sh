#!/usr/bin/env/bash

echo "installing emacs.."
DF_EMACS_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

if [[ $(uname) == "Darwin" ]]; then
    brew install git ripgrep coreutils fd
    xcode-select --install
    brew tap railwaycat/emacsmacport
    brew install emacs-mac --with-modules
    ln -fs /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app

elif [[ $(uname) == "Linux" ]]; then
    sudo apt update && sudo apt apt install git ripgrep fd-find
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
