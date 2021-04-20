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
alias myip="ip -br -c a"

# Apt update / upgrade
apt-updater() {
    sudo apt update && \
    sudo apt full-upgrade -Vy && \
    sudo apt autoremove -y && \
    sudo apt autoclean
}
