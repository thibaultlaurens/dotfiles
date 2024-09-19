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

# Increase the amount of command we keep in history
HISTSIZE=10000000
SAVEHIST=10000000

# Dont save duplicates in history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS


plugins=(
  alias-finder            # check if there is an alias defined for the command
  autoupdate              # automatically update custom-plugins
  colored-man-pages       # add colors to man pages
  docker                  # auto-completion for docker
  docker-compose          # auto-completion for docker-compose
  extract                 # an extract function that supports a lot of filetypes
  history                 # aliases for history command
  last-working-dir        # new shell jumps into last used dir
  sudo                    # prefix current or previous commands with sudo (press esc twice)
  tmux                    # aliases and zsh integrationfor tmux
  zsh-autosuggestions     # autosuggestions for zsh
  zsh-completions         # additional completion definitions for zZsh
  zsh-interactive-cd      # interactive tab completion for the cd command
  zsh-syntax-highlighting # syntax highlighting for zsh
  # must be declared after zsh-syntax-highlighting
  zsh-history-substring-search # zsh port of fish history search
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

# zsh-syntax-highlighting configuration
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'

# bind UP and DOWN arrow keys to history-substring-search
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# Load zmv function
autoload zmv

# Reload zsh completion
autoload -U compinit && compinit

if [ -f "/usr/local/bin/starship" ]; then
  # Hide warnings (i.e git timeout)
  export STARSHIP_LOG=error

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
PATH="/usr/bin:/bin:/usr/sbin:/sbin"
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Ruby
[ -d "/usr/local/opt/ruby/bin" ] && PATH="/usr/local/opt/ruby/bin:$PATH"

# Replace BSD with GNU core utils
PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"

# Add ~/bin to the PATH if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# Golang
GOPATH="$HOME/go"
[ -d "$GOPATH/bin" ] && PATH="$GOPATH/bin:$PATH"
[ -d "/usr/local/go/bin" ] && PATH="/usr/local/go/bin:$PATH"

# Doom emacs
[ -d "$HOME/.emacs.d/bin" ] && PATH="$HOME/.emacs.d/bin:$PATH"

# Source .zshrc dedicated to work environment
if [ -f "$HOME/work/.zshrc" ]; then
  source "$HOME/work/.zshrc"
fi

export PATH

### ALIASES ####################################################################

# Bare git repo config alias
alias config="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias lint-config="shellcheck -e SC1091,SC1090 $HOME/.install/*.sh"
alias ls-config="config ls-tree --full-tree -r HEAD"

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
alias less="bat --theme=ansi --style=header,grid" # replace "less -FSRXc"
alias ll="eza -abghlmU --all"
alias ln='ln -i'
alias mkdir="mkdir -pv"
alias mv='mv -i'
alias ps="ps -ef"
alias rm="rm -i"
alias tree="tree -aCF --dirsfirst -I '.git'"

# Shortcuts
alias c="config"
alias ddf="docker system df"
alias g="git"
alias r="reload"
alias tg="tig"
alias tm="tmux"

# Golang
alias gopath="cd $GOPATH"
alias gotest="go test -v -coverprofile='coverage.out' -race -failfast ./..."

# Python
alias python="/usr/local/bin/python3.11"
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

# Convert all flac files to mp3 files
alias flac_to_mp3="find . -name '*.flac' -exec ffmpeg -i {} -ab 320k -map_metadata 0 -id3v2_version 3 {}.mp3 \;"

# Kubernetes tools
alias kx="kubectx"
alias k9="k9s -c pod --readonly"

# Kubectl
alias k="kubectl"
alias kaf='kubectl apply -f'
alias kdc="kubectl describe configmap"
alias kdd="kubectl describe deployment"
alias kdp='kubectl describe pods'
alias kds='kubectl describe svc'
alias keti='kubectl exec --stdin --tty'
alias kgcc='kubectl config get-contexts'
alias kgcj="kubectl get cronjob"
alias kgcm="kubectl get configmap"
alias kgd="kubectl get deployements"
alias kge="kubectl get events"
alias kgi="kubectl get ingress"
alias kgp="kubectl get pods"
alias kgs='kubectl get svc'
alias kgsec="kubectl get secrets"
alias kl='kubectl logs'
alias klf1s='kubectl logs --since 1s -f'
alias klf5m='kubectl logs --since 5m -f'
alias klf="kubectl logs -f"
alias klo="kubectl login"
alias klos="kubectl login sync --ask --prune"
alias kpf="kubectl port-forward"
alias krrd="kubectl rollout restart deployment"
alias ksd="kubectl scale deployment"

### SH FUNCTIONS ###############################################################

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

### DOCKER FUNCTIONS ###########################################################

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

# Upload a docker image to the provided registry
docker_upload_image() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Please supply image:tag to pull and registry to push image in.
                \nUsage: $funcstack[1] <image:tag> <registry>"
  else
    docker pull $1
    docker tag $1 $2/$1

    docker login $2
    docker push $2/$1
  fi
}

# Upload all the docker image tags to a provided registry
docker_upload_images() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Please supply image to pull tags from and registry to push images in.
                \nUsage: $funcstack[1] <image> <registry>"
  else
    docker pull $1 --all-tags

    docker login $2
    docker images $1 \
      --format "docker tag {{.Repository}}:{{.Tag}} $2/{{.Repository}}:{{.Tag}} \
            | docker push $2/{{.Repository}}:{{.Tag}}" | bash
  fi
}

### KUBERNETES FUNCTIONS #######################################################

# Get pod IAM role $1 => servicename
pod_iam_role() {
  kubectl get po -lapp=$1 -o json | jq '.items [] .metadata .annotations ["iam.amazonaws.com/role"]'
}

# Get pod fail reason $1 => servicename
pod_fail_reason() {
  kubectl get po -lapp=$1 -o json | jq ".items [] .status .containerStatuses [] .lastState"
}

# Get service secrets $1 => servicename
pod_secrets() {
  kubectl get secret $1 -o go-template='{{ range $k, $v := .data }}{{$k}}={{ $v | base64decode | printf "%q"}}{{"\n"}}{{end}}'
}

# Get service parameters $1 => servicename
pod_config() {
  kubectl get cm $1 -o go-template='{{range $k, $v := .data}}{{printf "%s=%q\n" $k $v}}{{end}}'
}

# Get k8s node IPs for pods $1 => servicename
pod_ips() {
  kubectl get po -lapp=$1 -o json | jq ".items [] .status .hostIP"
}

# Get a random pod name $1 => servicename $2 => optional grep filter
pod_name() {
  FILTER=${2:--}
  kubectl get po -lapp=$1 --no-headers -o custom-columns=":metadata.name" | grep $FILTER | head -n 1
}

# Exec into bash shell of a random pod of a service $1 => servicename
pod_exec() {
  RANDOM_POD=$(pod_name $1)
  echo $RANDOM_POD
  kubectl exec --stdin --tty $RANDOM_POD -- /bin/bash
}

# Prints a pod environment variables $1 => servicename
pod_env() {
  RANDOM_POD=$(pod_name $1)
  echo $RANDOM_POD
  kubectl exec --stdin --tty $RANDOM_POD -- env
}

# Tail logs of a random pod (including canaries) of a service $1 => servicename
pod_logs() {
  RANDOM_POD=$(pod_name $1)
  echo $RANDOM_POD
  kubectl logs -f $RANDOM_POD
}

# Tail logs of a random canary pod of a service $1 => servicename
pod_logs_canary() {
  RANDOM_POD=$(pod_name $1 canary)
  echo $RANDOM_POD
  kubectl logs -f $RANDOM_POD
}

# Port forward a random pod of a service $1 => servicename $2 => port:port
pod_forward() {
  PORT=${2:-8001}
  RANDOM_POD=$(pod_name $1)
  echo $RANDOM_POD
  kubectl port-forward $RANDOM_POD $PORT
}

# Get all of the pod names matching $1 grep filter
pod_names() {
  FILTER=${1:--}
  NAMES=$(kubectl get pods -o jsonpath='{.items[*].metadata.labels.app}' |
    tr -s '[[:space:]]' '\n' | grep $FILTER | sort | uniq)
  echo $NAMES
}

# Get all versions of all pods matching the $1 grep filter
pod_versions() {
  FILTER=${1:--}
  kubectl get po -o jsonpath='{.items[*].spec.containers[*].image}' |
    tr -s '[[:space:]]' '\n' | sort | cut -d'/' -f3 | column -t -s':' |
    uniq -c | grep $FILTER
}

# Get the container images of all pods matching the $1 filter
pod_images() {
  FILTER=${1:--}
  kubectl get po -o jsonpath="{.items[*].spec.containers[*].image}" |
    tr -s '[[:space:]]' '\n' | sort | uniq -c | grep $FILTER
}

# Lists the -o wide view of all pods matching the filter
pod_details() {
  FILTER=${1--}
  kubectl get pods -o wide | grep $FILTER
}

### GIT FUNCTIONS ##############################################################

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

# Run go tests with colors on PASS and FAIL
go_test_with_colors() {
  gotest | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/''
}
