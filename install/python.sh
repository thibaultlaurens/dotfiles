#!/usr/bin/env bash

echo "installing python..."
brew install python

pip install --upgrade distribute
pip install --upgrade pip

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

pip install "${packages[@]}"

echo "installing python3..."
brew install python3
