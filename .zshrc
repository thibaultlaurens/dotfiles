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

# Set xdg home directory
export XDG_CONFIG_HOME="$HOME/.config"

# Set vim config path
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export VIMDOTDIR="$XDG_CONFIG_HOME/vim"

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
    docker
    docker-compose
    colored-man-pages
    extract
    git
    git-auto-fetch
    gnu-utils
    gpg-agent
    history
    last-working-dir
    pass
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

# load zmv function
autoload zmv

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
    eval "$(pyenv init --path)"
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

# bare git repo config alias
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias config-lint="shellcheck -e SC1091,SC1090 $HOME/.install/*.sh"

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

# Better defaults
alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias cp="cp -iv"
alias df="df -Th"
alias du="du -ach"
alias grep='grep --color=auto'
alias less="less -FSRXc"
alias ln='ln -i'
alias mkdir="mkdir -pv"
alias mv='mv -i'
alias rm="rm -iv"
alias tree="tree -aCF --dirsfirst -I '.git'"
alias cat="bat --theme=ansi"
alias ll="exa -abghlmFU --all --git"

# Shortcuts
alias c="clear"
alias dc="docker compose"
alias ddf="docker system df"
alias h="history"
alias t="tig"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Reload the shell
alias reload='exec $SHELL -l'

# List all TCP/UDP ports
alias ports='netstat -tulanp'

# External IP addresses
alias wanip='dig @resolver1.opendns.com A myip.opendns.com +short -4'
alias wanip6='dig @resolver1.opendns.com AAAA myip.opendns.com +short -6'

##### FUNCTIONS #####

# Makes a new dir and cd into it
cdmk() { echo "DEPRECATED: use \"take\" command instead" && take $1; }

# Pack a folder into a .tar.bz2
pack(){
    if [ -z "$1" ]; then
        echo "No directory supplied. \nUsage: $funcstack[1] directory-path"
    elif ! [[ -d $1 ]]; then
        echo "error: $1 is not a directory."
    else
        tar -cvjSf "$(date "+%F")-$1.tar.bz2" "$1"
    fi
}

# Unpack a .tar.bz2 folder
unpack(){
    if [ -z "$1" ]; then
        echo "No directory supplied. \nUsage: $funcstack[1] directory-path.tar.bz2"
    else
        tar xjf "$1"
    fi
}

# Prune everything docker related
docker-prune-all() {
    docker system prune -a -f --volumes
}

# Display the path to the volume data
docker-volume-path() {
    if [ -z "$1" ]; then
        echo "No volume supplied. \nUsage: $funcstack[1] volume-name"
        docker volume ls
    else
        docker volume inspect --format '{{ .Mountpoint }}' "$1"
    fi
}

# Sync a fork master branch
git-sync-fork() {
    if [ -z "$1" ]; then
        echo "No remote upstream repository specified.\n Usage: $funcstack[1] remote-repository"
    else
        git remote add upstream "$1"
        git remote -v
        git fetch upstream
        git checkout master
        git merge upstream/master
        git push origin master
    fi
}

# Archive all git repos from a given parent directory
git-archive-all(){
    if [ -z "$1" ]; then
        echo "No parent directory specified.\n Usage: $funcstack[1] parent-directory-path"
    elif ! [[ -d $1 ]]; then
        echo "error: $1 is not a directory."
    else
        fd -td -d 1 -x bash -c "git -C {} archive --output=../{/}.tar.gz --format=tar HEAD" ';' . $1
    fi
}

# Upgrade packages installed without package management
# Warning: takes ages and is very yolo, things might break !
custom-updater() {
    if [ -x "$(command -v npm)" ]; then
        echo "updating node packages"
        npm update -g
    fi
    if [ -x "$(command -v pip)" ]; then
        echo "updating python packages"
        pip freeze | cut -d'=' -f1 | xargs -n1 pip install -U
    fi
    if [ -x "$(command -v cargo)" ]; then
        echo "updating rust packages"
        cargo install-update -a
    fi
    if [ -x "$(command -v go)" ]; then
        echo "updating golang packages"
        go get -u all
    fi
    if typeset -f omz > /dev/null; then
        echo "updating oh my zsh"
        omz update
    fi
}

##### OS SPECIFIC #####

if [[ $(uname) == "Darwin" ]]; then
    # Replace osx ruby binaries
    PATH="/usr/local/opt/ruby/bin:$PATH"

    # Setup brew
    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_NO_INSECURE_REDIRECT=1
    export HOMEBREW_CASK_OPTS=--require-sha

    # Add cli colors
    export CLICOLOR=1

    # Better ps
    alias ps="ps -ef"

    # Copy pwd
    alias pwdcopy="pwd | tr -d '\n' | pbcopy"

    # IP address
    alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"

    # Lock the screen
    alias afk="open /System/Library/CoreServices/ScreenSaverEngine.app"

    # Restart dns
    alias restart-dns="sudo killall -9 mDNSResponder"

    # Empty the trash on all mounted volumes, the main hdd and clear system logs
    rm-trashes() {
        sudo rm -rfv /Volumes/*/.Trashes && \
        sudo rm -rfv ~/.Trash && \
        sudo rm -rfv /private/var/log/asl/*.asl
    }

    # Homebrew update / upgrade
    brew-updater() {
        brew update && \
        brew upgrade && \
        brew autoremove && \
        brew cleanup && \
        brew doctor
    }

elif [[ $(uname) == "Linux" ]]; then
    # Add snaps in PATH
    PATH="/snap/bin:$PATH"

    # Open files, dirs or urls
    alias open="xdg-open"

    # Copy and paste
    alias pbcopy="xclip -selection clipboard"
    alias pbpaste="xclip -selection clipboard -o"

    # Better defaults
    alias free="free -mt"
    alias ps="ps auxf"
    alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

    # IP addresses
    alias myip="ip -br -c a"

    # Apt update / upgrade
    apt-updater() {
        sudo apt update && \
        sudo apt full-upgrade -Vy && \
        sudo apt autoremove -y && \
        sudo apt autoclean
    }
fi

# Source zshrc dedicated to work environment
if [ -f "$HOME/work/.zshrc" ]; then
    source "$HOME/work/.zshrc"
fi

# reload zsh completion
autoload -U compinit && compinit

##### PROMPT #####

eval "$(starship init zsh)"
