#!/usr/bin/env/bash

export NVM_DIR="$HOME/.nvm"

# Install or update nvm
if [ ! "$(command -v nvm)" ]; then
  echo "\e[34mInstalling nvm:\e[0m"
  brew install nvm
else
  echo "\e[34mUpgrading nvm:\e[0m"
  brew upgrade nvm
fi

# Load NVM
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"

# Install node
echo "\e[34mInstalling node:\e[0m"
nvm install 16.5.0
nvm alias default v16.5.0
nvm use default

packages=(
  'bash-language-server' # a language server for Bash
  'diff-so-fancy'        # better diff
  'markdownlint'         # style checker and lint tool for Markdown
  'marked'               # a markdown parser built for speed
  'prettier'             # code formatter
  'tern'                 # js analyzer
  'vmd'                  # preview markdown files
)

echo "\e[34mInstalling node packages:\e[0m"
npm install -f -g npm
npm install -f -g "${packages[@]}"
echo "\e[34mDone.\e[0m"
