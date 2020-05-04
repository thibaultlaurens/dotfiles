#!/usr/bin/env/bash

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
alias gh="cd ~/git"
alias ghgo='cd $GOPATH/src/github.com'
alias lg="cd /var/log"

# Default options
alias cp="cp -iv"
alias df="df -Th"
alias du="du -ach | sort -h"
alias grep='grep --color=auto'
alias less="less -FSRXc"
alias ll='ls -FGlahp --color=always'
alias mkdir="mkdir -pv"
alias rm="rm -Iv"
alias tree="tree -aCF --dirsfirst -I '.git|node_modules'"

# Shortcuts
alias c="clear"
alias dc="docker-compose"
alias dex="docker exec -it"
alias git="hub"
alias h="history"
alias t="tmux"
alias v="vim"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Reload the shell
alias reload='exec $SHELL -l'

# External IP addresses
alias wanip='dig @resolver1.opendns.com A myip.opendns.com +short -4'
alias wanip6='dig @resolver1.opendns.com AAAA myip.opendns.com +short -6'

# Always list directory contents upon 'cd'
cdls() { cd "$@" || exit && ls; }

# Makes new Dir and jumps inside
cdmk() { mkdir -p "$@" && cd "$@" || exit; }

# Fuzzy find file
ff() { find . -type f -iname "*$1*"; }

# Fuzzy find directory
fd() { find . -type d -iname "*$1*"; }

# Syntax highligh in cat
function cat() {
    local out colored
    out=$(/bin/cat "$@")
    colored=$(echo "$out" | pygmentize -f console -g 2>/dev/null)
    [[ -n $colored ]] && echo "$colored" || echo "$out"
}

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
function docker-prune-all() {
    docker system prune -a -f --volumes
}

# Prune all docker images
function docker-prune-images() {
    docker rmi -f "$(docker images -f dangling=true -q --no-trunc)"
}

# Display the path to the volume data
function docker-volume-path() {
    if [ -z "$1" ]; then
        echo "No volume supplied."
        docker volume ls
    else
        docker volume inspect --format '{{ .Mountpoint }}' "$1"
    fi
}

# Sync a fork master branch
function git-sync-fork() {
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

# Alias all the git directories
GIT_REPOS="$HOME/git/thibault"
if [ -d "$GIT_REPOS" ]; then
    REPOS=$(find "$GIT_REPOS" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
    for REPO in $REPOS; do
        # shellcheck disable=SC2139
        alias "$REPO=cd $GIT_REPOS/$REPO"
    done
fi
