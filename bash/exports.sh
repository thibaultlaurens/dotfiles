#!/bin/bash

# Proper locale
: "$LANG:=\"en_US.UTF-8\""
: "$LANGUAGE:=\"en\""
: "$LC_CTYPE:=\"en_US.UTF-8\""
: "$LC_ALL:=\"en_US.UTF-8\""
export LANG LANGUAGE LC_CTYPE LC_ALL

# Always use passive mode FTP
: "$FTP_PASSIVE:=1"
export FTP_PASSIVE

# Make vim the default editor
export EDITOR="vim"

# Ignore duplicate commands and commands that begin with a space in the history
export HISTCONTROL="ignoreboth"

# Allow 32³ lines of history file, the default is 500
export HISTFILESIZE="32768"
export HISTSIZE="32768"

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr
export PYTHONIOENCODING="UTF-8"

# Don’t clear the screen after quitting a manual page
PAGER="less -FirSwX"
MANPAGER="$PAGER"
export PAGER MANPAGER

# get colors in manual pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Set terminal emulator
export TERM="xterm-256color"
