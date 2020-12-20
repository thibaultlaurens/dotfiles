#!/usr/bin/env/bash

packages=(
    apt-transport-https
    aspell
    bat
    build-essential
    ca-certificates
    coreutils
    ctop
    curl
    dconf-cli
    findutils
    firefox
    fonts-powerline
    fzf
    gcc
    gir1.2-clutter-1.0
    gir1.2-gtop-2.0
    gir1.2-nm-1.0
    git
    glslang-tools
    gnome-shell-extensions
    gnome-tweak-tool
    gnupg-agent
    graphviz
    gufw
    htop
    httpie
    ispell
    jq
    keepassxc
    laptop-mode-tools
    lnav
    make
    markdown
    moreutils
    net-tools
    nmap
    openssh-client
    openssl
    openvpn
    p7zip-full
    p7zip-rar
    procps
    ranger
    rar
    ripgrep
    sed
    shellcheck
    silversearcher-ag
    software-properties-common
    tmux
    tree
    ubuntu-restricted-extras
    unrar
    vim
    vlc
    wmctrl
    xclip
)


echo "upgrading packages.."
sudo apt update && sudo apt dist-upgrade

echo "installing packages.."
sudo apt install "${packages[@]}"
sudo apt autoremove

# fix name clash for bat and fd on ubuntu
sudo ln -fs /usr/bin/batcat /usr/local/bin/bat

echo "done"
