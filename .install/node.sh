#!/usr/bin/env/bash

export NVM_DIR="$HOME/.nvm"

# Install or update nvm
if [ ! "$(command -v nvm)" ]; then
  echo "Installing nvm:"
  brew install nvm
else
  echo "Upgrading nvm:"
  brew upgrade nvm
fi

# Load NVM
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"

# Install node
echo "Installing node:"
nvm install 16.5.0
nvm alias default v16.5.0
nvm use default

packages=(
  'bash-language-server' # a language server for Bash
  'diff-so-fancy'        # better diff
  'js-beautify'          # beautifier for javascript
  'markdownlint'         # style checker and lint tool for Markdown
  'marked'               # a markdown parser built for speed
  'prettier'             # code formatter
  'stylelint'            # css linter
  'tern'                 # js analyzer
  'vmd'                  # preview markdown files
  'pyright'              # static type checker for Python
)

echo "Installing node packages:"
npm install -f -g npm
npm install -f -g "${packages[@]}"
echo "Done."
