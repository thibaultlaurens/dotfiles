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
alias gt="cd ~/git"
alias lg="cd /var/log"

# Default options
alias cp="cp -iv"
alias df="df -Th"
alias du="du -ach"
alias grep='grep --color=auto'
alias less="less -FSRXc"
alias ll='ls -FGlahp --color=always'
alias mkdir="mkdir -pv"
alias rm="rm -Iv"
alias tree="tree -aCF --dirsfirst -I '.git'"

# Shortcuts
alias c="clear"
alias dc="docker-compose"
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
cd() { builtin cd "$@" || exit && ll; }

# Makes new Dir and jumps inside
cdmk() { mkdir -p "$@" && cd "$@" || exit; }

# Fuzzy find file
fff() { find . -type f -iname "*$1*"; }

# Fuzzy find directory
ffd() { find . -type d -iname "*$1*"; }

# Syntax highligh in cat
cat() {
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

# Archive extraction
extract () {
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf "$1"    ;;
      *.tar.gz)    tar xzf "$1"    ;;
      *.bz2)       bunzip2 "$1"    ;;
      *.rar)       unrar x "$1"    ;;
      *.gz)        gunzip "$1"     ;;
      *.tar)       tar xf "$1"     ;;
      *.tbz2)      tar xjf "$1"    ;;
      *.tgz)       tar xzf "$1"    ;;
      *.zip)       unzip "$1"      ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1"       ;;
      *.deb)       ar x "$1"       ;;
      *.tar.xz)    tar xf "$1"     ;;
      *.tar.zst)   unzstd "$1"     ;;      
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
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

# Cd alias one level of directory given a base path
alias-dirs() {
    if [ -z "$1" ]; then
        echo "No directory path specified."
    elif [ -d "$1" ]; then
        REPOS=$(find "$1" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
        for REPO in $REPOS; do
            # shellcheck disable=SC2139
            alias "$REPO=cd $1/$REPO"
        done
    fi
}
