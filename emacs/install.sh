#!/usr/bin/env/bash

echo "installing emacs.."

if [[ $(uname) == "Darwin" ]]; then
    brew tap d12frosted/emacs-plus
    brew install emacs-plus
    ln -s /usr/local/Cellar/emacs-plus/*/Emacs.app/ /Applications/

elif [[ $(uname) == "Linux" ]]; then
    sudo add-apt-repository ppa:kelleyk/emacs
    sudo apt update
    sudo apt install emacs27
fi

# backup default emacs
cd ~ || exit
mv .emacs.d .emacs.d.bak
mv .emacs .emacs.bak

# install chemacs startup script
wget -O ~/.emacs https://raw.githubusercontent.com/plexus/chemacs/master/.emacs
ln -fs "$(pwd)/.emacs-profiles.el" "$HOME/.emacs-profiles.el"

# install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/spacemacs
ln -fs "$(pwd)/.spacemacs" "$HOME/.spacemacs"

# install doom-emacs
git clone https://github.com/hlissner/doom-emacs ~/doom-emacs
ln -fs "$(pwd)/.doom.d" "$HOME/.doom.d"
~/doom-emacs/bin/doom install

# use doom-emacs as default emacs
echo 'doom' > "$HOME/.emacs-profile"

echo "done"
