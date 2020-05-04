#!/usr/bin/env/bash

echo "installing spacemacs.."

if [[ $(uname) == "Darwin" ]]; then
    brew tap d12frosted/emacs-plus
    brew install emacs-plus
    ln -s /usr/local/Cellar/emacs-plus/*/Emacs.app/ /Applications/

elif [[ $(uname) == "Linux" ]]; then
    sudo add-apt-repository ppa:kelleyk/emacs
    sudo apt update
    sudo apt install emacs26
fi

cd ~ || exit
mv .emacs.d .emacs.d.bak
mv .emacs .emacs.bak

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

echo "done"
