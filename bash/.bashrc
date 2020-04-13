#!/bin/bash

# Complete hostnames from this file
: "$HOSTFILE=~/.ssh/known_hosts"

# Base Path
PATH="/usr/sbin:/usr/bin:/sbin:/bin"
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

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

# source os related bash_profile
if [[ $(uname) == "Darwin" ]]; then
    # shellcheck source=bash/.bashrc.darwin
    source "$DOTFILES/bash/.bashrc.darwin"
elif [[ $(uname) == "Linux" ]]; then
    # shellcheck source=bash/.bashrc.linux
    source "$DOTFILES/bash/.bashrc.linux"
fi

# shellcheck source=bash/aliases
source "$DOTFILES/bash/aliases"
# shellcheck source=bash/exports
source "$DOTFILES/bash/exports"
# shellcheck source=bash/functions
source "$DOTFILES/bash/functions"
# shellcheck source=bash/options
source "$DOTFILES/bash/options"
# shellcheck source=bash/prompt
source "$DOTFILES/bash/prompt"

# exta help specific to work
if [ -f "$HOME/.bashrc.work" ]; then
    # shellcheck disable=SC1090
    source "$HOME/.bashrc.work"
fi
