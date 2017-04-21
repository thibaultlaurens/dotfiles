#!/usr/bin/env bash

packages=(
    bunyan
    coffee-script
    n_
    node-dev
    node-inspector
    tern
    avn
    avn-nvm
    vmd
)

if test ! $(which nvm)
then
    echo "installing node..."

    # clone nvm repo into ~/.nvm
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
    source ~/.bash_profile

    # install node version 0.12
    nvm install 0.12

    echo "installing npm packages..."
    npm install -g "${packages[@]}"

    # setup automatic node version switching
    avn setup

    # install latest stable version
    nvm install node --reinstall-packages-from=0.12

    # use node version 0.12
    nvm use 0.12

    # use node version 0.12 node by default
    nvm alias default 0.12
fi
