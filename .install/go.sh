#!/usr/bin/env/bash

# Install or update go
: "${GOPATH:=$HOME/go}"
if [ ! "$(command -v go)" ]; then
  echo "Installing go:"
  brew install go golangci-lint
else
  echo "Upgrading go:"
  brew upgrade go golangci-lint
fi

# Create the directory structure for the go workspace
mkdir -p "$HOME/go/"{bin,src}""

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

echo "Installing go packages:"

go install 'golang.org/x/tools/gopls@latest' # used by emacs lsp layer
go install 'mvdan.cc/sh/v3/cmd/shfmt@latest' # used by emacs fmt layer

# Used by emacs golang layer
go install 'github.com/x-motemen/gore/cmd/gore@latest' # repl
go install 'github.com/stamblerre/gocode@latest'       # code completion and eldoc support
go install 'golang.org/x/tools/cmd/godoc@latest'       # documentation lookup
go install 'golang.org/x/tools/cmd/goimports@latest'   # fmt on save and fix import
go install 'golang.org/x/tools/cmd/gorename@latest'    # refactoring
go install 'golang.org/x/tools/cmd/guru@latest'        # code navigation and refactoring
go install 'github.com/cweill/gotests/gotests@latest'  # generate test code
go install 'github.com/fatih/gomodifytags@latest'      # tag manipulation
go install 'github.com/jessfraz/dockfmt@latest'        # docker file format

echo "Done."
