#!/usr/bin/env/bash

echo "Installing emacs:"
brew install git ripgrep coreutils fd
xcode-select --install

brew tap d12frosted/emacs-plus
brew install emacs-plus --with-native-comp

osascript -e 'tell application "Finder" to make alias file to posix file "/opt/homebrew/opt/emacs-plus@29/Emacs.app" at POSIX file "/Applications" with properties {name:"Emacs.app"}'

# Clone doom emacs repo
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d

# Install and setup doom emacs
~/.emacs.d/bin/doom install

# Show potential issues on the system
~/.emacs.d/bin/doom doctor

echo "Done."
