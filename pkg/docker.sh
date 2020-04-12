#!/bin/bash

echo "installing docker..."

if [[ $(uname) == "Darwin" ]]; then
    brew cask install docker
    brew install docker-completion
elif [[ $(uname) == "Linux" ]]; then
    sudo apt remove docker docker-engine docker.io containerd runc
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io
    systemctl start docker
    systemctl enable docker
    sudo usermod -aG docker thibault
fi
