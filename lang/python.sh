#!/usr/bin/env bash

echo "installing python..."

if [[ `uname` == "Darwin" ]]; then
    brew install pyenv
elif [[ `uname` == "Linux" ]]; then
    curl https://pyenv.run | bash
    exec $SHELL
fi

pyenv install 3.7.7
pyenv global 3.7.7

PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

echo "installing python packages..."

packages=(
    autoflake                   # removes unused imports and unused variables
    black                       # code formatter
    epc                         # RPC stack for Emacs Lisp
    flake8                      # style guide enforcement
    importmagic                 # find unresolved imports
    ipython[all]                # interactive python
    isort                       # sort imports
    pip                         # package installer
    python-language-server[all] # language server protocol for python
    setuptools                  # build and distribute packages
    virtualenv                  # create isolated python environments
    virtualenvwrapper           # extensions for virtualenv
    yamllint                    # linter for YAML files
)

pip install --upgrade "${packages[@]}"
