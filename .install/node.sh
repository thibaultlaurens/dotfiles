#!/usr/bin/env/bash

brew install node

packages=(
  'js-beautify'          # beautifier for javascript
  'markdownlint-cli'     # style checker and lint tool for Markdown
  'marked'               # a markdown parser built for speed
  'prettier'             # code formatter
  'stylelint'            # css linter
  'tern'                 # js analyzer
)

echo "Installing node packages:"
brew install "${packages[@]}"

echo "Done."
