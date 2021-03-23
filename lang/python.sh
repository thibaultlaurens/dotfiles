#!/usr/bin/env/bash

# Prepare the python build environment
if [[ $(uname) == "Darwin" ]]; then
    brew install openssl readline sqlite3 xz zlib
elif [[ $(uname) == "Linux" ]]; then
    sudo apt update && sudo apt install --no-install-recommends \
        make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
        libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
        xz-utils tk-dev libffi-dev liblzma-dev git
fi

# Install or update pyenv
: "${PYENV_ROOT:=$HOME/.pyenv}"
if [ ! -d "$PYENV_ROOT" ]; then
    echo "installing pyenv.."

    if [[ $(uname) == "Darwin" ]]; then
        brew install pyenv
    elif [[ $(uname) == "Linux" ]]; then
        curl https://pyenv.run | bash
    fi
else
    git -C "$PYENV_ROOT" pull
fi

# Setup pyenv
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Install python
echo "installing python.."
pyenv install 3.8.6
pyenv global 3.8.6

packages=(
    'black'                       # code formatter
    'ipython[all]'                # interactive python
    'isort'                       # sort imports
    'mypy'                        # optional static typing checker
    'pipenv'                      # python development workflow for humans
    'pyflakes'                    # checks python source files for errors
    'pytest'                      # test python code
    'python-language-server[all]' # python language server
    'virtualenv'                  # create isolated python environments
    'virtualenvwrapper'           # extensions for virtualenv
    'yamllint'                    # linter for YAML files
)

echo "upgrading pip, setuptools and wheel.."
pip install --upgrade pip setuptools wheel

echo "installing python packages.."
pip install --upgrade "${packages[@]}"

echo "done"
