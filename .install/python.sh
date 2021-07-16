#!/usr/bin/env/bash

# Install or update pyenv
: "${PYENV_ROOT:=$HOME/.pyenv}"
if [ ! "$(command -v pyenv)" ]; then
  echo "\e[34mInstalling pyenv:\e[0m"
  brew install openssl readline sqlite3 xz zlib
  brew install pyenv
else
  echo "\e[34mUpgrading pyenv:\e[0m"
  brew upgrade pyenv
fi

# Setup pyenv
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Install python
echo "\e[34mInstalling python:\e[0m"
pyenv install 3.9.6
pyenv global 3.9.6

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

echo "\e[34mUpgrading pip, setuptools and wheel:\e[0m"
pip install --upgrade pip setuptools wheel

echo "\e[34mInstalling python packages:\e[0m"
pip install --upgrade "${packages[@]}"

echo "\e[34mDone.\e[0m"
