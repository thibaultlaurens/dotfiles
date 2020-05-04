#!/usr/bin/env/bash

export GIT_PS1_SHOWDIRTYSTATE=1         # '*'=unstaged, '+'=staged
export GIT_PS1_SHOWSTASHSTATE=1         # '$'=stashed
export GIT_PS1_SHOWUNTRACKEDFILES=1     # '%'=untracked
export GIT_PS1_SHOWUPSTREAM="verbose"   # 'u='=no difference, 'u+1'=ahead by 1 commit

function set_prompts {
    local user_and_host="\[\033[01;34m\]\u@\h"
    local location="\[\033[01;36m\]\w"
    local ps1_color="\[\033[01;37m\]"
    local tail="\[\033[01;34m\]$"
    local last_color="\[\033[00m\]"

    PS1="$user_and_host $location$ps1_color\$(__git_ps1) $tail$last_color "
}

set_prompts
