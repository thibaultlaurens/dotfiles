#!/usr/bin/env/bash

# Install homebrew if it's missing
if test ! "$(which brew)"; then
 echo "installing brew.."
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

sudo chown -R "$(whoami)" "$(brew --prefix)"/*

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

packages=(
    ag
    aspell
    bat
    brew-cask-completion
    coreutils
    ctop
    curl-openssl
    ffmpeg
    findutils
    fzf
    gawk
    git
    gnu-indent
    gnu-sed
    gnu-tar
    gpg
    graphviz
    grep
    gzip
    htop
    httpie
    hugo
    ispell
    jq
    less
    lnav
    make
    markdown
    moreutils
    monit
    nmap
    openssh
    openssl
    rg
    shellcheck
    tmux
    tree
    unrar
    vim
    watch
    wget
)

echo "upgrading packages.."
brew update && brew upgrade && brew doctor

# Add more sources
brew tap Homebrew/bundle

echo "installing packages.."
brew install "${packages[@]}"
brew cleanup && brew doctor

echo "done"
