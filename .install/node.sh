#!/usr/bin/env/bash

# Install nvm
echo "installing nvm.."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install node
echo "installing node.."
nvm install 16.4.1
nvm alias default v16.4.1
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

echo "installing node packages.."
npm install -f -g "${packages[@]}"
echo "done"
