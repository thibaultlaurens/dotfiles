#!/usr/bin/env bash

# ask for the administrator password upfront
sudo -v

# add hub PPA
sudo add-apt-repository ppa:cpick/hub

sudo apt-get update && apt-get upgrade

packages=(
    apt-transport-https
    ca-certificates
    bash
    bash-completion
    build-essential
    coreutils
    curl
    ctop
    dconf-cli
    findutils
    fonts-powerline
    git
    gnome-tweak-tool
    gnupg-agent
    graphviz
    htop
    httpie
    hub
    i3
    icdiff
    ispell
    jq
    lnav
    markdown
    moreutils
    ncdu
    net-tools
    nodejs
    npm
    openssh-server
    openssl
    procps # for "watch"
    ranger
    rxvt-unicode
    sed
    shellcheck
    silversearcher-ag
    snapd
    software-properties-common
    thunderbird
    tmux
    tree
    unrar
    vim
    wmctrl
)

echo "installing packages..."
sudo apt-get install "${packages[@]}"
sudo apt-get autoremove
