#!/usr/bin/env bash

# Load urxvt db
xrdb "$HOME/.Xresources"

# Load bash completion
source /etc/bash_completion

# Add snaps in the PATH
PATH="/snap/bin:$PATH"

# Open files, dirs or urls
alias o="xdg-open"

# Copy and paste
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# Better defaults
alias free="free -mt"
alias ps="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# IP addresses
alias myip="ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
alias myip6="ip -6 addr | grep -oP '(?<=inet6\s)[\da-f:]+'"

# Apt update / upgrade
function apt-updater {
	  sudo apt update && \
	  sudo apt full-upgrade -Vy && \
	  sudo apt autoremove -y && \
	  sudo apt autoclean
}

# Fix bash_completion on Makefiles
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make
