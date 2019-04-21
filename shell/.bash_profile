#!/usr/bin/env bash

# load bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# load Z
if [ -f `brew --prefix`/etc/profile.d/z.sh ]; then
    . `brew --prefix`/etc/profile.d/z.sh
fi

# load FZF and configure it
if [ -f ~/.fzf.bash ]; then
    . ~/.fzf.bash
    export FZF_COMPLETION_TRIGGER='~~'
    export FZF_COMPLETION_OPTS='+c -x'
    export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# load git prompt
if [ -f `brew --prefix`/opt/bash-git-prompt/share/gitprompt.sh ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
fi

# replace osx utilities with GNU utilities
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

# add sbin into the PATH
export PATH="/usr/local/sbin:$PATH"

# add openssl into the PATH
export PATH="/usr/local/opt/openssl/bin:$PATH"

# go environment variables
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export GO111MODULE=on

# add python into the PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# add rust into the PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/bin/racer:$PATH"

# add ruby into the PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Load the shell dotfiles
export DOTFILE="${HOME}/git/thibault/dotfiles"

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
source ~/.work_profile
