#!/usr/bin/env bash

# bash completion

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# git prompt

if [ -f `brew --prefix`/opt/bash-git-prompt/share/gitprompt.sh ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
fi

# Load the shell dotfiles

DOTFILE="${HOME}/github/thibault/dotfiles"

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

# Load nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
