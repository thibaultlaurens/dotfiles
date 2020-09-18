#!/usr/bin/env/bash

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
    gir1.2-nm-1.0
    git
    gnome-shell-extension-system-monitor
    gnome-tweak-tool
    gnupg-agent
    graphviz
    gufw
    htop
    httpie
    hub
    icdiff
    ispell
    jq
    keepassxc
    lnav
    markdown
    moreutils
    neofetch
    net-tools
    nmap
    openssl
    openssh-client
    openvpn
    procps
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

echo "installing packages.."
sudo apt update && sudo apt upgrade

# Add hub ppa
sudo add-apt-repository ppa:cpick/hub

sudo apt install "${packages[@]}"
sudo apt autoremove
echo "done"
