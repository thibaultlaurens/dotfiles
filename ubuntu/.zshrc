#!/usr/bin/env/zsh

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
alias myip="ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
alias myip6="ip -6 addr | grep -oP '(?<=inet6\s)[\da-f:]+'"

# Apt update / upgrade
function apt-updater {
    sudo apt update && \
    sudo apt full-upgrade -Vy && \
    sudo apt autoremove -y && \
    sudo apt autoclean
}
