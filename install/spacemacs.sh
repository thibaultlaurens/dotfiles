#!/usr/bin/env bash

echo "installing spacemacs..."
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew linkapps emacs-plus

cd ~
mv .emacs.d .emacs.d.bak
mv .emacs .emacs.bak

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.di
