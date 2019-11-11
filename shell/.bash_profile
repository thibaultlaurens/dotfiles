#!/usr/bin/env bash

export DOTFILE="${HOME}/git/tlaurens/dotfiles"

if [[ $(uname -s) == Darwin ]]; then
    source $DOTFILE/osx/bash_profile
else
    source $DOTFILE/ubuntu/bash_profile
fi

# add sbin into the PATH
export PATH="/usr/local/sbin:$PATH"

# add openssl into the PATH
export PATH="/usr/local/opt/openssl/bin:$PATH"

# go environment variables
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export GO111MODULE=on

# add python into the PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# add rust into the PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/bin/racer:$PATH"

# add ruby into the PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Load the shell dotfiles
load_files() {
    declare -a files=(
        $DOTFILE/shell/aliases
        $DOTFILE/shell/exports
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

# exta help specific to work
if [ -f ~/.work_profile ]; then
    source ~/.work_profile
fi
