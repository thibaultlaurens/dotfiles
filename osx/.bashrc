#!/bin/bash

# Load bash completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    # shellcheck disable=SC1090
    . "$(brew --prefix)/etc/bash_completion"
fi

# Setup brew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# replace osx utilities with GNU utilities
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

# Copy pwd
alias pwdcopy="pwd|tr -d '\n'|pbcopy"

# IP address
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"

# Lock the screen
alias afk="open /System/Library/CoreServices/ScreenSaverEngine.app"

# Restart dns
alias reset-dns="sudo killall -9 mDNSResponder"

# Recursively delete `.DS_Store` files
alias rm-dsstore="find . -type f -name '*.DS_Store' -ls -delete"

# Homebrew update
alias brew-upgrade="brew update; brew upgrade; brew cask upgrade; brew cleanup; brew doctor"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
alias empty-trash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Moves a file to the MacOS trash
function trash () {
    command mv "$@" ~/.Trash ;
}

# Open man page as PDF
function manpdf() {
    man -t "$1" | open -f -a /Applications/Preview.app/
}
