#!/usr/bin/env bash

# ask for the administrator password upfront
sudo -v

# add all the PPAs first
sudo add-apt-repository ppa:kelleyk/emacs
sudo add-apt-repository ppa:cpick/hub

sudo apt update
sudo apt upgrade

packages=(
    apt-transport-https
    ca-certificates
    bash
    bash-completion
    coreutils
    curl
    ctop
    dconf-cli
    emacs26
    findutils
    git
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
    net-tools
    nodejs
    npm
    openssh-server
    openssl
    procps # for "watch"
    sed
    silversearcher-ap
    software-properties-common
    tree
    unrar
    vim
)

echo "installing packages..."
sudo apt install "${packages[@]}"

apps=(
    chromium-browser
    transmission
    vlc
)

echo "installing snaps..."
sudo apt install "${apps[@]}"

sudo apt autoremove

# install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo npm install -g tern

# install ctop
sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.2/ctop-0.7.2-linux-amd64 -O /usr/local/bin/ctop
sudo chmod +x /usr/local/bin/ctop

# install terminal themes (select Maia theme)
bash -c  "$(wget -qO- https://git.io/vQgMr)"
