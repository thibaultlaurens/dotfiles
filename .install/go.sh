#!/usr/bin/env/bash

# Install or update go
: "${GOPATH:=$HOME/go}"
if [ ! "$(command -v go)" ]; then
  echo "\e[34mInstalling go:\e[0m"
  brew install go golangci-lint
else
  echo "\e[34mUpgrading go:\e[0m"
  brew upgrade go golangci-lint
fi

# Create the directory structure for the go workspace
mkdir -p "$HOME/go/"{bin,src}""

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

echo "\e[34mInstalling go packages:\e[0m"

go install 'github.com/google/pprof@latest' # visualization and analysis of profiling data

go install 'golang.org/x/tools/gopls@latest' # used by emacs lsp layer
go install 'mvdan.cc/sh/v3/cmd/shfmt@latest' # used by emacs fmt layer

# Used by emacs golang layer
go install 'github.com/stamblerre/gocode@latest'     # code completion & eldoc support
go install 'golang.org/x/tools/cmd/godoc@latest'     # documentation lookup
go install 'golang.org/x/tools/cmd/gorename@latest'  # refactoring
go install 'github.com/motemen/gore/cmd/gore@latest' # repl
go install 'golang.org/x/tools/cmd/guru@latest'      # code navigation and refactoring
go install 'golang.org/x/tools/cmd/goimports@latest' # fmt on save and fix imports
go install 'github.com/cweill/gotests/...@latest'    # generate test code
go install 'github.com/fatih/gomodifytags@latest'    # tag manipulation

echo "\e[34mDone.\e[0m"
