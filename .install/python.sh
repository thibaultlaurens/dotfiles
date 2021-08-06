#!/usr/bin/env/bash

# Install or update pyenv
: "${PYENV_ROOT:=$HOME/.pyenv}"
if [ ! "$(command -v pyenv)" ]; then
  echo "Installing pyenv:"
  brew install openssl readline sqlite3 xz zlib
  brew install pyenv
else
  echo "Upgrading pyenv:"
  brew upgrade pyenv
fi

# Setup pyenv
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Install python
echo "Installing python:"
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

echo "Upgrading pip, setuptools and wheel:"
pip install --upgrade pip setuptools wheel

echo "Installing python packages:"
pip install --upgrade "${packages[@]}"

echo "Done."
