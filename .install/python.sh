#!/usr/bin/env/bash

brew install python

packages=(
  'black'             # code formatter
  'ipython[all]'      # interactive python
  'isort'             # sort imports
  'mypy'              # optional static typing checker
  'pipenv'            # python development workflow for humans
  'pyflakes'          # checks python source files for errors
  'pytest'            # test python code
  'pyright'           # static type checker
  'virtualenv'        # create isolated python environments
  'virtualenvwrapper' # extensions for virtualenv
  'yamllint'          # linter for YAML files
)

echo "Upgrading pip, setuptools and wheel:"
/usr/local/bin/python3 -m pip install --upgrade pip setuptools wheel

echo "Installing python packages:"
/usr/local/bin/python3 -m pip install --upgrade "${packages[@]}"

echo "Done."
