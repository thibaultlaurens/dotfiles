#!/usr/bin/env zsh

# Replace osx ruby binaries
PATH="/usr/local/opt/ruby/bin:$PATH"

# Setup brew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# Add cli colors
export CLICOLOR=1

# Replace osx utilities with GNU utilities
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

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
