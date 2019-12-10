#!/usr/bin/env bash

echo "installing go..."

if [[ $(uname -s) == Darwin ]]; then
    brew install go
else
    sudo add-apt-repository ppa:longsleep/golang-backports
    sudo apt update
    sudo apt install golang-go
fi

# create the directory structure for the go workspace
mkdir -p $HOME/go/{bin,src}

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

echo "installing go packages..."

packages=(
    golang.org/x/tools/cmd/godoc            # extract and generate doc
    golang.org/x/tools/cmd/guru             # navigate across go code in editors
    golang.org/x/tools/cmd/gorename         # precise type-safe renaming
    golang.org/x/tools/cmd/goimports        # drop in replacement for gofmt
    github.com/nsf/gocode                   # autocompletion daemon
    github.com/k0kubun/pp                   # pretty printer
    github.com/motemen/gore                 # go REPL
    github.com/rogpeppe/godef               # find symbol information in go code
    github.com/mailgun/godebug              # cross-platform debugger
)

go get -u -v "${packages[@]}"