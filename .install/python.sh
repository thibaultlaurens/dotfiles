#!/usr/bin/env/bash

brew install python

packages=(
  'black'             # code formatter
  'ipython'           # interactive python
  'isort'             # sort imports
  'mypy'              # optional static typing checker
  'pipenv'            # python development workflow for humans
  'poetry'            # packaging and dependency management
  'pyright'           # static type checker for Python
  'virtualenv'        # create isolated python environments
  'virtualenvwrapper' # extensions for virtualenv
  'yamllint'          # linter for YAML files
)

echo "Installing python packages via brew:"
brew install "${packages[@]}"

python_packages=(
  'pyflakes'          # checks python source files for errors
  'pytest'            # test python code
)

echo "Installing python packages via pip:"
/opt/homebrew/bin/pip3 install --break-system-packages --user --upgrade "${python_packages[@]}"

echo "Done."
