#!/usr/bin/env bash

if test ! $(which nvm)
then
    echo "installing node..."

    # clone nvm repo into ~/.nvm
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
    source ~/.bash_profile

    # install node version 0.12
     nvm install 0.12

    # install latest stable version
    nvm install node

    # use node version 0.12
    nvm use 0.12

    # use node version 0.12 node by default
    nvm alias default 0.12
fi

echo "installing npm packages..."
packages=(
    bunyan
    coffee-script
    n_
    node-dev
    node-inspector
)

npm install -g "${packages[@]}"
