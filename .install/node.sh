#!/usr/bin/env/bash

brew install node

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
