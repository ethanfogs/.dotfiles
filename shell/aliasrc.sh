# FILE-SYSTEM - READING -------------------------------------------------------

alias ls="ls -FG"
alias ll="ls -lFG"
alias la="ls -AFG"
alias lla="ls -lAFG"
alias lal="ls -lAFG"

function fs(){
    find ${@:-.} -not -type d 2> /dev/null | sort
}

function ds(){
    find ${@:-.} -type d 2> /dev/null | sort
}

[[ $(command -v tree) ]] && alias tree='tree -C'

# FILE-SYSTEM - WRITING -------------------------------------------------------

alias mkdir='mkdir -p'
function mcd(){
    mkdir -p "${1}" && cd "${1}"
}

function trash(){
    for file in $@; do
        # this check for macOS throwing an error when trying to move .DS_Store
        [[ $file =~ ".*.DS_Store" ]] && rm $file || mv -f $file ~/.Trash/
    done
}

function chx(){
    [ -x $1 ] && chmod -x $1 || chmod +x $1
}

# TEXT EDITOR -----------------------------------------------------------------

alias edit=$EDITOR
alias e=$EDITOR

# GIT -------------------------------------------------------------------------

function git_switch(){
    [ -n $1 ] && git switch $1 || git switch main
}

alias gs="git status --short"
[ $(command -v nvim) ] && alias gss="nvim -c 'G | bdelete 1'"
alias gS="git status"
alias gl="git log --oneline"
alias gL="git log"
alias gb="git branch"
alias gco="git checkout"
alias gcb="git checkout -b"

function gsw(){
    [ -n ] && git switch $1 || git checkout -
}

alias ga="git add"
alias gA="git add ."
alias gd="git diff"

alias gc="git commit"
alias gC="git add . && git commit"

alias gp="git push"
alias gps="git push"
alias gP="git pull"
alias gpl="git pull"

alias gm="git merge"

#------------------------------------------------------------------------------

#function nvim_man(){ nvim -c "Man $1 | only" }
#which nvim > /dev/null && alias man=nvim_man

#------------------------------------------------------------------------------
# vim: filetype=bash:
