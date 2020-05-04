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
    'golang.org/x/tools/cmd/godoc'          # extract and generate doc
    'golang.org/x/tools/cmd/goimports'      # drop in replacement for gofmt
    'golang.org/x/tools/cmd/gorename'       # precise type-safe renaming
    'golang.org/x/tools/cmd/guru'           # navigate across go code in editors

    'github.com/cweill/gotests/...'
    'github.com/davidrjenni/reftools/cmd/fillstruct'
    'github.com/fatih/gomodifytags'
    'github.com/godoctor/godoctor'
    'github.com/haya14busa/gopkgs/cmd/gopkgs'
    'github.com/josharian/impl'
    'github.com/k0kubun/pp'                 # pretty printer
    'github.com/mailgun/godebug'            # cross-platform debugger
    'github.com/mdempsky/gocode'            # autocompletion daemon
    'github.com/motemen/gore'               # go REPL
    'github.com/rogpeppe/godef'             # find symbol information in go code
    'github.com/zmb3/gogetdoc'
)

echo "installing go packages.."
go get -u -v "${packages[@]}"

echo "installing golangcli-lint.."
# Binary will be $(go env GOPATH)/bin/golangci-lint
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)/bin" v1.24.0
echo "done"
