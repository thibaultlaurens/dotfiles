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
    fd-find
    findutils
    firefox
    fonts-powerline
    gcc
    gir1.2-clutter-1.0
    gir1.2-gtop-2.0
    gir1.2-nm-1.0
    git
    gnome-tweak-tool
    gnupg-agent
    graphviz
    gufw
    htop
    httpie
    icdiff
    ispell
    jq
    keepassxc
    lnav
    make
    markdown
    moreutils
    neofetch
    net-tools
    nmap
    openssh-client
    openssl
    openvpn
    procps
    ranger
    ripgrep
    rxvt-unicode
    sed
    shellcheck
    silversearcher-ag
    software-properties-common
    tmux
    tree
    unrar
    vim
    wmctrl
    xclip
)


echo "upgrading packages.."
sudo apt update && sudo apt dist-upgrade

echo "installing new packages.."
sudo apt install "${packages[@]}"
sudo apt autoremove
echo "done"
