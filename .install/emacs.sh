#!/usr/bin/env/bash

echo "Installing emacs:"
brew install git ripgrep coreutils fd
xcode-select --install

brew tap railwaycat/emacsmacport
brew install emacs-mac --with-modules
ln -fs /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app

# Clone doom emacs repo
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d

# Install and setup doom emacs
~/.emacs.d/bin/doom install

# Show potential issues on the system
~/.emacs.d/bin/doom doctor

echo "Done."
