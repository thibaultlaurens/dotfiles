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
    gir1.2-gtop-2.0
    gir1.2-networkmanager-1.0
    gir1.2-clutter-1.0
    gnome-tweak-tool
    gnupg-agent
    graphviz
    gufw
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
    neofetch
    net-tools
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
    xclip
)

echo "installing packages..."
sudo apt-get install "${packages[@]}"
sudo apt-get autoremove
