#!/usr/bin/env/bash

echo "installing emacs.."

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

# Install and setup doom emacs
~/.emacs.d/bin/doom install

# Show potential issues on the system
~/.emacs.d/bin/doom doctor

echo "done"
