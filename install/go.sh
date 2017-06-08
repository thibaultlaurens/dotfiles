#!/usr/bin/env bash

export GOPATH=$HOME/golang
export PATH=$PATH:$GOPATH/bin

mkdir $GOPATH
mkdir -p $GOPATH/src/github.com/thibaultlaurens

echo "installing go..."
brew install go

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
    github.com/alecthomas/gometalinter      # concurrent go linter
    github.com/mailgun/godebug              # cross-platform debugger
)

go get -u -v "${packages[@]}"

gometalinter --install --update
