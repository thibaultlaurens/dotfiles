#!/usr/bin/env zsh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

##### EXPORT ##### 

# Proper locale
: "$LANG:=\"en_US.UTF-8\""
: "$LANGUAGE:=\"en\""
: "$LC_CTYPE:=\"en_US.UTF-8\""
: "$LC_ALL:=\"en_US.UTF-8\""
export LANG LANGUAGE LC_CTYPE LC_ALL

# Make vim the default editor
export EDITOR="vim"

# Set terminal emulator
export TERM="xterm-256color"

# Set terminal for the gpg-agent
export GPG_TTY=$(tty)

##### OH MY ZSH #####

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Use hyphen-insensitive completion: _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Disable command auto-correction.
ENABLE_CORRECTION="false"

# Disable auto-setting terminal title. 
DISABLE_AUTO_TITLE="true"

# Change the command execution time stamp shown in the history command output
HIST_STAMPS="yyyy-mm-dd"

plugins=(
    alias-finder
    colored-man-pages
    extract
    git
    history
    sudo
    zsh-autosuggestions 
    zsh-completions
    zsh-interactive-cd
    zsh-syntax-highlighting
)

# enable option-stacking for docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

source $ZSH/oh-my-zsh.sh

##### USER CONFIG #####

# Basics
: "${HOME:=~}"
: "${LOGNAME:=$(id -un)}"
: "${UNAME=$(uname)}"

# Swap greadlink for readlink on macos..
if [[ $(uname) == "Darwin" ]]; then
    alias readlink="greadlink"
fi

# Complete hostnames from this file
: "${HOSTFILE=~/.ssh/known_hosts}"

# Base Path
PATH="/usr/sbin:/usr/bin:/sbin:/bin"
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Add ~/bin to the PATH if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# Python
PYENV_ROOT="$HOME/.pyenv"
[ -d "$PYENV_ROOT/bin" ] && PATH="$PYENV_ROOT/bin:$PATH"
if [ -x "$(command -v pyenv)" ]; then
    eval "$(pyenv init -)"
fi

# Golang
GOPATH="$HOME/go"
[ -d "$GOPATH/bin" ] && PATH="$GOPATH/bin:$PATH"
[ -d "/usr/local/go/bin" ] && PATH="/usr/local/go/bin:$PATH"

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Rust
[ -s "$HOME/.cargo/env" ] && \. "$HOME/.cargo/env"

# Doom emacs
[ -d "$HOME/.emacs.d/bin" ] && PATH="$HOME/.emacs.d/bin:$PATH"

##### ALIASES #####

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Quick cd
alias dl="cd ~/Downloads"
alias dm="cd ~/Documents"
alias dr="cd ~/drive"
alias dt="cd ~/Desktop"
alias gt="cd ~/git"
alias lg="cd /var/log"

# Default options
alias cp="cp -iv"
alias df="df -Th"
alias du="du -ach"
alias grep='grep --color=auto'
alias less="less -FSRXc"
alias mkdir="mkdir -pv"
alias rm="rm -Iv"
alias tree="tree -aCF --dirsfirst -I '.git'"

# Shortcuts
alias c="clear"
alias dc="docker-compose"
alias h="history"
alias t="tmux"
alias v="vim"

# Drop in replacements
alias cat="bat --theme=ansi-dark"
alias ll="exa -abghlmFU --git"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Reload the shell
alias reload='exec $SHELL -l'

# External IP addresses
alias wanip='dig @resolver1.opendns.com A myip.opendns.com +short -4'
alias wanip6='dig @resolver1.opendns.com AAAA myip.opendns.com +short -6'

##### FUNCTIONS #####

# Makes a new dir and cd into it
cdmk() { mkdir -p "$@" && cd "$@" || exit; }

# Prompt to edit the given path if called with one parameter
mv() {
    if [ "$#" -ne 1 ] || [ ! -e "$1" ]; then
        command mv -iv "$@"
        return
    fi

    read -r -ei "$1" newfilename
    command mv -iv -- "$1" "$newfilename"
}

# Prune everything docker related
docker-prune-all() {
    docker system prune -a -f --volumes
}

# Prune all docker images
docker-prune-images() {
    docker rmi -f "$(docker images -f dangling=true -q --no-trunc)"
}

# Display the path to the volume data
docker-volume-path() {
    if [ -z "$1" ]; then
        echo "No volume supplied."
        docker volume ls
    else
        docker volume inspect --format '{{ .Mountpoint }}' "$1"
    fi
}

# Sync a fork master branch
git-sync-fork() {
    if [ -z "$1" ]; then
        echo "No remote upstream repository specified."
    else
        git remote add upstream "$1"
        git remote -v
        git fetch upstream
        git checkout master
        git merge upstream/master
        git push origin master
    fi
}

# Upgrade packages installed without package management
# Warning: takes ages and is very yolo, things might break !
custom-updater() {
    if [ -x "$(command -v npm)" ]; then
        echo "upadting node packages"
        npm update -g
    fi
    if [ -x "$(command -v pip)" ]; then
        echo "upadting python packages"
        pip freeze | cut -d'=' -f1 | xargs -n1 pip install -U
    fi
    if [ -x "$(command -v cargo)" ]; then
        echo "upadting rust packages"
        cargo install-update -a
    fi
    if [ -x "$(command -v go)" ]; then
        echo "upadting golang packages"
        go get -u all
    fi
    if typeset -f omz > /dev/null; then
        echo "upadting oh my zsh"
        omz update
    fi
}

##### EXTRA #####

DF_ZSH_DIR="$(dirname "$(readlink -f "${(%):-%N}")")"

# Source os related zshrc
if [[ $(uname) == "Darwin" ]]; then
    source "$DF_ZSH_DIR/../osx/.zshrc"
elif [[ $(uname) == "Linux" ]]; then
    source "$DF_ZSH_DIR/../ubuntu/.zshrc"
fi

# Source zshrc dedicated to work environment
if [ -f "$DF_ZSH_DIR/../work/.zshrc" ]; then
    source "$DF_ZSH_DIR/../work/.zshrc"
fi

# reload zsh completion
autoload -U compinit && compinit

##### PROMPT #####

eval "$(starship init zsh)"
