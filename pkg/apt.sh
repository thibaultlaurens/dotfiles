#!/bin/bash

# ask for the administrator password upfront
sudo -v

# add hub PPA
sudo add-apt-repository ppa:cpick/hub

sudo apt update && apt upgrade

packages=(
    apt-transport-https
    bash
    bash-completion
    build-essential
    ca-certificates
    coreutils
    ctop
    curl
    dconf-cli
    findutils
    firefox
    fonts-powerline
    gir1.2-clutter-1.0
    gir1.2-gtop-2.0
    gir1.2-networkmanager-1.0
    git
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
    neofetch
    net-tools
    nmap
    openssh
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
sudo apt install "${packages[@]}"
sudo apt autoremove
