#!/usr/bin/env bash

echo "installing go..."
brew install go

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

echo "installing dep..."
brew install dep

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
