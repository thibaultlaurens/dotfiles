#!/usr/bin/env bash

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Recursive globbing with "**"
shopt -s globstar

# Correct dir spellings
shopt -s cdspell;

# Ex: `**/qux` will enter `./foo/bar/baz/qux`
shopt -s autocd;

# Append rather than overwrite history on exit
shopt -s histappend;

# Do not autocomplete when accidentally pressing Tab on an empty line.
shopt -s no_empty_cmd_completion

# Basics
: "${HOME:=~}"
: "${LOGNAME:=$(id -un)}"
: "${UNAME=$(uname)}"

# Swap greadlink for readlink on macos..
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

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Custom bash aliases, exports and prompt
source "$DIR/aliases.sh"
source "$DIR/exports.sh"
source "$DIR/prompt.sh"

# Cd alias personal git repos
GIT_REPOS="$HOME/git/thibault"
alias "thibault=cd $GIT_REPOS"
alias-dirs $GIT_REPOS

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
