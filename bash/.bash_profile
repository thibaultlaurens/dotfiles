#!/usr/bin/env bash

export DOTFILE="${HOME}/git/thibault/dotfiles"

# source os related bash_profile
if [[ $(uname -s) == Darwin ]]; then
    source $DOTFILE/bash/.bash_profile.osx
else
    source $DOTFILE/bash/.bash_profile.ubuntu
fi

# add sbin into PATH
export PATH="/usr/local/sbin:$PATH"

# add openssl into PATH
export PATH="/usr/local/opt/openssl/bin:$PATH"

# go environment variables
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# add python into PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# add rust into PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/bin/racer:$PATH"

# add ruby into PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"

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
