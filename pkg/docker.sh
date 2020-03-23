#!/usr/bin/env bash

echo "installing docker..."

if [[ $(uname -s) == Darwin ]]; then
    brew cask install docker
    brew install docker-completion
else
    sudo apt-get remove docker docker-engine docker.io containerd runc
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    systemctl start docker
    systemctl enable docker
    sudo usermod -aG docker thibault
fi
