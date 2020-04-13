#!/bin/bash

# Basics
: "$HOME=~"
: "$LOGNAME=$(id -un)"
: "$UNAME=$(uname)"

export GIT_REPOS="$HOME/git/thibault"
export DOTFILES="$GIT_REPOS/dotfiles"

if [ -f "$HOME/.bashrc" ]; then
    # shellcheck source=bash/.bashrc
    source "$HOME/.bashrc"
fi
