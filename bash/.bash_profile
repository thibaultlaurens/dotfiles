#!/usr/bin/env bash

# Basics
: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}

# Complete hostnames from this file
: ${HOSTFILE=~/.ssh/known_hosts}

# Base Path
PATH="/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin"
PATH="/usr/local/bin:$PATH"

# ~/bin if it exists
test -d "$HOME/bin" &&
    PATH="$HOME/bin:$PATH"

# Python
PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Golang
GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"
PATH="/usr/local/go/bin:$PATH"

# Rust
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/.cargo/bin/racer:$PATH"

# Ruby
PATH="/usr/local/opt/ruby/bin:$PATH"

# Dotfile repo path
DOTFILE="${HOME}/git/thibault/dotfiles"

# source os related bash_profile
if [[ `uname` == "Darwin" ]]; then
    source $DOTFILE/bash/.bash_profile.darwin
elif [[ `uname` == "Linux" ]]; then
    source $DOTFILE/bash/.bash_profile.linux
fi

# Load all the bash config files
load_files() {
    declare -a files=(
        $DOTFILE/bash/aliases
        $DOTFILE/bash/exports
        $DOTFILE/bash/functions
        $DOTFILE/bash/options
        $DOTFILE/bash/prompt
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

# exta help specific to work
if [ -f ~/.work_profile ]; then
    source ~/.work_profile
fi
