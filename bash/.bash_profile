#!/bin/bash

# Basics
: "$HOME=~"
: "$LOGNAME=$(id -un)"
: "$UNAME=$(uname)"

# Complete hostnames from this file
: "$HOSTFILE=~/.ssh/known_hosts"

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
DOTFILES="${HOME}/git/thibault/dotfiles"

# source os related bash_profile
if [[ $(uname) == "Darwin" ]]; then
    # shellcheck source=bash/.bash_profile.darwin
    source "$DOTFILES/bash/.bash_profile.darwin"
elif [[ $(uname) == "Linux" ]]; then
    # shellcheck source=bash/.bash_profile.linux
    source "$DOTFILES/bash/.bash_profile.linux"
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
if [ -f ~/.work_profile ]; then
    # shellcheck disable=SC1090
    source ~/.work_profile
fi
