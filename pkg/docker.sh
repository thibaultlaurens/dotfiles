#!/usr/bin/env bash

echo "installing docker..."

if [[ $(uname -s) == Darwin ]]; then
    brew cask install docker
    brew install docker-completion
else
    sudo apt install docker-ce
    systemctl start docker
    systemctl enable docker
    sudo usermod -aG docker thibault
fi
