#!/usr/bin/env/bash

echo "installing go.."

if [[ $(uname) == "Darwin" ]]; then
    brew install go golangci-lint
fi

# Create the directory structure for the go workspace
mkdir -p "$HOME/go/"{bin,src}""

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

packages=(
    # visualization and analysis of profiling data
    'github.com/google/pprof'

    # used by emacs golang layer
    'github.com/stamblerre/gocode'     # code completion & eldoc support
    'golang.org/x/tools/cmd/godoc'     # documentation lookup
    'golang.org/x/tools/cmd/gorename'  # refactoring
    'github.com/motemen/gore/cmd/gore' # repl
    'golang.org/x/tools/cmd/guru'      # code navigation and refactoring
    'golang.org/x/tools/cmd/goimports' # fmt on save and fix imports
    'github.com/cweill/gotests/...'    # generate test code
    'github.com/fatih/gomodifytags'    # tag manipulation

    # used by emacs lsp layer
    'golang.org/x/tools/gopls' # lsp server

    # used by emacs fmt layer
    'mvdan.cc/sh/v3/cmd/shfmt'
)

echo "installing go packages.."
go get -u -v "${packages[@]}"

echo "done"
