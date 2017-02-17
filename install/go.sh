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
    github.com/nsf/gocode
    github.com/k0kubun/pp
    github.com/motemen/gore
)

go get -u "${packages[@]}"
