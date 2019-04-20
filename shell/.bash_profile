#!/usr/bin/env bash

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# git prompt
if [ -f `brew --prefix`/opt/bash-git-prompt/share/gitprompt.sh ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
fi

# go environment variables
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# enable go modules
export GO111MODULE=on

# path for python
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# path for rust
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/bin/racer:$PATH"

# path for ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# path for java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH=${JAVA_HOME}/bin:$PATH

# Load the shell dotfiles
DOTFILE="${HOME}/git/thibault/dotfiles"

load_files() {
    declare -a files=(
        $DOTFILE/shell/aliases
        $DOTFILE/shell/exports
        $DOTFILE/shell/functions
        $DOTFILE/shell/options
        $DOTFILE/shell/prompt
    )

    # if these files are readable, source them
    for index in ${!files[*]}
    do
        if [[ -r ${files[$index]} ]]; then
            source ${files[$index]}
        fi
    done
}

load_files

# exta help specific to work
source ~/Google\ Drive/Work/work_profile

# FZF config
export FZF_COMPLETION_TRIGGER='~~'
export FZF_COMPLETION_OPTS='+c -x'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PATH="/usr/local/sbin:$PATH"

# bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# add coreutils into the PATH
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# add findutils into the PATH
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"

# add getext into the PATH
export PATH="/usr/local/opt/gettext/bin:$PATH"

# add gnused into the PATH
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# add openssl into the PATH
export PATH="/usr/local/opt/openssl/bin:$PATH"

