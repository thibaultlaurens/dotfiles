#!/usr/bin/env zsh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

### EXPORT #####################################################################

# Proper locale
: "$LANG:=\"en_US.UTF-8\""
: "$LANGUAGE:=\"en\""
: "$LC_CTYPE:=\"en_US.UTF-8\""
: "$LC_ALL:=\"en_US.UTF-8\""
export LANG LANGUAGE LC_CTYPE LC_ALL

# Make vim the default editor
export EDITOR="vim"

# Set terminal emulator
export TERM="screen-256color"

# Set terminal for the gpg-agent
export GPG_TTY=$(tty)

# Set xdg home directory
export XDG_CONFIG_HOME="$HOME/.config"

# Set vim config path
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export VIMDOTDIR="$XDG_CONFIG_HOME/vim"

# Set brew options
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

# Add cli colors
export CLICOLOR=1

### OH MY ZSH ##################################################################

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Use hyphen-insensitive completion: _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Disable command auto-correction.
ENABLE_CORRECTION="false"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Change the command execution time stamp shown in the history command output
HIST_STAMPS="dd.mm.yyyy"

# Skip duplicates in Ctrl+r search
setopt HIST_FIND_NO_DUPS

plugins=(
  alias-finder            # check if there is an alias defined for the command
  autoupdate              # automatically update custom-plugins
  colored-man-pages       # add colors to man pages
  docker                  # auto-completion for docker
  docker-compose          # auto-completion for docker-compose
  extract                 # an extract function that supports a lot of filetypes
  gpg-agent               # start gpg-agent if its not running
  history                 # aliases for history command
  last-working-dir        # new shell jumps into last used dir
  sudo                    # prefix current or previous commands with sudo (press esc twice)
  zsh-autosuggestions     # autosuggestions for zsh
  zsh-completions         # additional completion definitions for zZsh
  zsh-interactive-cd      # interactive tab completion for the cd command
  zsh-syntax-highlighting # syntax highlighting for zsh
  tmux                    # aliases and zsh integrationfor tmux
)

# Automatically starts tmux
ZSH_TMUX_AUTOSTART=true

# Set tmux configuration path
ZSH_TMUX_CONFIG="$HOME/.config/tmux/tmux.conf"

# Check for aliases on each command
ZSH_ALIAS_FINDER_AUTOMATIC=true

# Enable option-stacking for docker (i.e docker run -it <TAB>)
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

source $ZSH/oh-my-zsh.sh

# Load zmv function
autoload zmv

# Source .zshrc dedicated to work environment
if [ -f "$HOME/work/.zshrc" ]; then
  source "$HOME/work/.zshrc"
fi

# Reload zsh completion
autoload -U compinit && compinit

if [ -f "/usr/local/bin/starship" ]; then
  eval "$(starship init zsh)"
fi

### USER CONFIG ################################################################

# Basics
: "${HOME:=~}"
: "${LOGNAME:=$(id -un)}"
: "${UNAME=$(uname)}"

# Complete hostnames from this file
: "${HOSTFILE=~/.ssh/known_hosts}"

# Base Path
PATH="/usr/sbin:/usr/bin:/sbin:/bin"
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Add ~/bin to the PATH if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# Golang
GOPATH="$HOME/go"
[ -d "$GOPATH/bin" ] && PATH="$GOPATH/bin:$PATH"
[ -d "/usr/local/go/bin" ] && PATH="/usr/local/go/bin:$PATH"

# Ruby
[ -d "/usr/local/opt/ruby/bin" ] && PATH="/usr/local/opt/ruby/bin:$PATH"

# Doom emacs
[ -d "$HOME/.emacs.d/bin" ] && PATH="$HOME/.emacs.d/bin:$PATH"

# Replace BSD with GNU core utils
PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"

### ALIASES ####################################################################

# Bare git repo config alias
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias lint-config="shellcheck -e SC1091,SC1090 $HOME/.install/*.sh"

# Reload the shell
alias reload='exec $SHELL -l'

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
alias df="df -h"
alias du="du -ach"
alias grep='grep --color=auto'
alias less="bat --theme=ansi" # replace "less -FSRXc"
alias ll="exa -abghlmFU --all"
alias ln='ln -i'
alias mkdir="mkdir -pv"
alias mv='mv -i'
alias ps="ps -ef"
alias rm="rm -i"
alias tree="tree -aCF --dirsfirst -I '.git'"

# Shortcuts
alias c="config"
alias ddf="docker system df"
alias r="reload"
alias tg="tig"
alias tm="tmux"

# Python
alias python="/usr/local/bin/python3"
alias pip="/usr/local/bin/pip3"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# List all TCP/UDP ports
alias ports='netstat -tulanp'

# External IP addresses
alias wanip='dig @resolver1.opendns.com A myip.opendns.com +short -4'
alias wanip6='dig @resolver1.opendns.com AAAA myip.opendns.com +short -6'

# Copy pwd
alias pwdcopy="pwd | tr -d '\n' | pbcopy"

# IP address
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"

# Lock the screen
alias afk="open /System/Library/CoreServices/ScreenSaverEngine.app"

# Restart dns
alias restart_dns="sudo killall -9 mDNSResponder"

### FUNCTIONS ##################################################################

# Makes a new dir and cd into it
cdmk() { echo "DEPRECATED: use \"take\" command instead" && take $1; }

# Pack a folder into a .tar.bz2
pack() {
  if [ -z "$1" ]; then
    echo "No directory supplied. \nUsage: $funcstack[1] directory-path"
  elif ! [[ -d $1 ]]; then
    echo "Error: $1 is not a directory."
  else
    tar -cvjSf "$(date "+%F")-$1.tar.bz2" "$1"
  fi
}

# Unpack a .tar.bz2 folder
unpack() {
  if [ -z "$1" ]; then
    echo "No directory supplied. \nUsage: $funcstack[1] directory-path.tar.bz2"
  else
    tar xjf "$1"
  fi
}

# Empty the trash on all mounted volumes, the main hdd and clear system logs
rm_trashes() {
  sudo rm -rfv /Volumes/*/.Trashes &&
    sudo rm -rfv ~/.Trash &&
    sudo rm -rfv /private/var/log/asl/*.asl
}

# Homebrew update / upgrade
brew_updater() {
  brew update &&
    brew upgrade &&
    brew autoremove &&
    brew cleanup -s &&
    brew doctor
}

# Upgrade packages installed without package management
custom_updater() {
  [ -s "$HOME/.install/node.sh" ] && \. "$HOME/.install/node.sh"
  [ -s "$HOME/.install/python.sh" ] && \. "$HOME/.install/python.sh"
  [ -s "$HOME/.install/go.sh" ] && \. "$HOME/.install/go.sh"

  if typeset -f omz >/dev/null; then
    omz update
  fi
}

# Prune everything docker related
docker_prune_all() {
  docker system prune -a -f --volumes
}

# Display the path to the volume data
docker_volume_path() {
  if [ -z "$1" ]; then
    echo "No volume supplied. \nUsage: $funcstack[1] volume-name"
    docker volume ls
  else
    docker volume inspect --format '{{ .Mountpoint }}' "$1"
  fi
}

# Sync a fork master branch
git_sync_fork() {
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
git_archive_all() {
  if [ -z "$1" ]; then
    echo "No parent directory specified.\n Usage: $funcstack[1] parent-directory-path"
  elif ! [[ -d $1 ]]; then
    echo "Error: $1 is not a directory."
  else
    fd -td -d 1 -x bash -c "git -C {} archive --output=../{/}.tar.gz --format=tar HEAD" ';' . $1
  fi
}
