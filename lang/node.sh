#!/usr/bin/env/bash

# Install nvm
echo "installing nvm.."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source "$HOME/.bashrc"

# Install node
echo "installing node.."
nvm install 14.2.0
nvm use 14.2.0

packages=(
    'bash-language-server'
    'diff-so-fancy'     # better diff                  
    'dockerfile-language-server-nodejs'
    'eslint'            # syntax checker               
    'eslint-cli'        # syntax checker cli           
    'import-js'         # automatic dependencies import
    'js-beautify'       # beautifier for javascript
    'markdownlint'      # style checker and lint tool for Markdown
    'marked'            # a markdown parser built for speed
    'prettier'          # code formatter               
    'stylelint'         # a mighty, modern style linter
    'tern'              # js analyzer                 
    'vmd'               # preview markdown files       
)

echo "installing node packages.."
npm install -g "${packages[@]}"
echo "done"
