#!/bin/bash

# Basics
: "${HOME:=~}"
: "${LOGNAME:=$(id -un)}"
: "${UNAME=$(uname)}"

# swap greadlink for readlink on macos..
if [[ $(uname) == "Darwin" ]]; then
    alias readlink="greadlink"
fi

DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

# Complete hostnames from this file
: "${HOSTFILE=~/.ssh/known_hosts}"

# Base Path
PATH="/usr/sbin:/usr/bin:/sbin:/bin"
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Add ~/bin to the PATH if it exists
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

# Custom bash aliases, functions, prompt etc.
source "$DIR/aliases.sh"
source "$DIR/exports.sh"
source "$DIR/functions.sh"
source "$DIR/options.sh"
source "$DIR/prompt.sh"

# Tmux completion
source "$DIR/../tmux/.tmux_completion"

# Source os related bashrc
if [[ $(uname) == "Darwin" ]]; then
    source "$DIR/../osx/.bashrc"
elif [[ $(uname) == "Linux" ]]; then
    source "$DIR/../ubuntu/.bashrc"
fi

# Source bashrc dedicated to work environment
if [ -f "$DIR/../work/.bashrc" ]; then
    source "$DIR/../work/.bashrc"
fi
