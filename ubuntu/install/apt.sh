#!/usr/bin/env bash

# ask for the administrator password upfront
sudo -v

# add hub PPA
sudo add-apt-repository ppa:cpick/hub

sudo apt update
sudo apt upgrade

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
    silversearcher-ap
    snapd
    software-properties-common
    thunderbird
    tree
    unrar
    vim
)

echo "installing packages..."
sudo apt install "${packages[@]}"
sudo apt autoremove
