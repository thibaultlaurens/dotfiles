#!/usr/bin/env bash

sudo apt-get update

echo "installing python..."
sudo apt-get -y install python3-pip

echo "installing python packages..."
packages=(
    virtualenv
    virtualenvwrapper
    flake8
    autoflake
    jedi
    json-rpc
    service-factory
    yapf
    isort
    ipython[all]
)

sudo pip3 install "${packages[@]}"
