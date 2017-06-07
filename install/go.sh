#!/usr/bin/env bash

export GOPATH=$HOME/golang
export PATH=$PATH:$GOPATH/bin

mkdir $GOPATH
mkdir -p $GOPATH/src/github.com/thibaultlaurens

echo "installing go..."
brew install go

echo "installing go packages..."
packages=(
    golang.org/x/tools/cmd/godoc
    golang.org/x/tools/cmd/guru
    golang.org/x/tools/cmd/gorename
    golang.org/x/tools/cmd/goimports
    github.com/nsf/gocode
    github.com/k0kubun/pp
    github.com/motemen/gore
    github.com/rogpeppe/godef
    github.com/alecthomas/gometalinter
    github.com/mailgun/godebug
)

go get -u -v "${packages[@]}"

gometalinter --install --update
