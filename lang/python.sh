#!/usr/bin/env bash

echo "installing python..."

if [[ $(uname -s) == Darwin ]]; then
    brew install python3
else
    sudo apt update
    sudo apt install -y python3-pip
fi

pip3 install --upgrade pip setuptools distribute

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
    importmagic
    epc
    black
    python-language-server
)

pip3 install --upgrade "${packages[@]}"
