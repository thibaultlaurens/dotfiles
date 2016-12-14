#!/usr/bin/env bash

DOTFILE="${HOME}/github/thibault/dotfiles"

# Load the shell dotfiles

load_files() {
    declare -a files=(
        $DOTFILE/shell/aliases
        $DOTFILE/shell/exports
        $DOTFILE/shell/extra
        $DOTFILE/shell/functions
        $DOTFILE/shell/options
        $DOTFILE/shell/prompt
    )

    # if these files are readable, source them
    for index in ${!files[*]}
    do
        if [[ -r ${files[$index]} ]]; then
            source ${files[$index]}
        fi
    done
}

load_files
unset load_files

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
