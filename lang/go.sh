#!/usr/bin/env/bash

echo "installing go.."

if [[ $(uname) == "Darwin" ]]; then
    brew install go
elif [[ $(uname) == "Linux" ]]; then
    sudo add-apt-repository ppa:longsleep/golang-backports
    sudo apt update
    sudo apt install golang-go
fi

# Create the directory structure for the go workspace
mkdir -p "$HOME/go/{bin,src}"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

packages=(
    # used by emacs golang layer 
    'github.com/cweill/gotests/...'         # generate test code
    'github.com/fatih/gomodifytags'         # tag manipulation
    'github.com/motemen/gore/cmd/gore'      # repl
    'github.com/stamblerre/gocode'          # code completion & eldoc support
    'golang.org/x/tools/cmd/godoc'          # documentation lookup
    'golang.org/x/tools/cmd/goimports'      # fmt on save and fix imports
    'golang.org/x/tools/cmd/gorename'       # refactoring
    'golang.org/x/tools/cmd/guru'           # code navigation and refactoring
    
    # used by emacs lsp layer 
    'golang.org/x/tools/gopls'              # lsp server
    
    # used by emacs docker layer
    'github.com/jessfraz/dockfmt'           # dockerfile fmt
)

echo "installing go packages.."
go get -u -v "${packages[@]}"

echo "installing golangcli-lint.."
# Binary will be $(go env GOPATH)/bin/golangci-lint
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)/bin" v1.31.0

echo "done"
