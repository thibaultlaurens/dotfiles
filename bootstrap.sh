#!/usr/bin/env bash

source brew.sh
source npm.sh

echo "creating bash symlink ..."

ln -fs $HOME/dotfiles/bash/.bash_profile $HOME/.bash_profile
source $HOME/.bash_profile

echo -n "creating atom and vim settings ..."
ln -fs $HOME/dotfiles/atom ~/.atom
ln -fs $HOME/dotfiles/bash/.vimrc $HOME/.vimrc

echo "all done"
