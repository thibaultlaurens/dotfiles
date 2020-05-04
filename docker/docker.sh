#!/usr/bin/env/bash

echo "installing docker.."

if [[ $(uname) == "Darwin" ]]; then
    brew cask install docker
    brew install docker-completion

elif [[ $(uname) == "Linux" ]]; then
    sudo apt remove docker docker-engine docker.io containerd runc

    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io

    systemctl enable docker
    systemctl start docker
    sudo usermod -aG docker tlaurens
fi

echo "done"
