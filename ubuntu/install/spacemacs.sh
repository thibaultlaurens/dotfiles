#!/usr/bin/env bash

# add emacs PPA
sudo add-apt-repository ppa:kelleyk/emacs

sudo apt update
sudo apt upgrade

# install emacs
sudo apt install emacs26

# install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
