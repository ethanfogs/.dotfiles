# FILE-SYSTEM - READING -------------------------------------------------------

alias ls="ls -FG"
alias ll="ls -lFG"
alias la="ls -aFG"
alias lla="ls -laFG"
alias lal="ls -laFG"

function files(){ find ${@:-.} -not -type d 2> /dev/null | sort; }
function dirs (){ find ${@:-.} -type d 2> /dev/null | sort; }
alias fs='files'
alias ds='dirs'

command -v tree > /dev/null && alias tree='tree -C'

# FILE-SYSTEM - WRITING -------------------------------------------------------

alias mkdir='mkdir -p'
function mcd(){ mkdir -p "${1}" && cd "${1}"; }

function trash(){
    for file in $*; do
        [[ $file =~ ".*.DS_Store" ]] && rm $file || mv -f $file ~/.Trash/
    done;
}

#alias rm='trash'

alias chx='chmod +x'

# text editor -----------------------------------------------------------------

alias edit=$EDITOR
alias e=$EDITOR

# GIT -------------------------------------------------------------------------

function git_switch(){
    [ -n $1 ] && git switch $1 || git switch main
}

alias gs="git status --short"
alias gss="nvim -c 'G | bdelete 1'"
alias gS="git status"
alias gl="git log --oneline"
alias gL="git log"
alias gsh="git show --oneline"
alias gb="git branch"
alias gbr="git branch"
alias gch="git checkout"
alias gco="git checkout -b"
alias gsw="git switch"
alias ga="git add"
alias gA="git add ."
alias gc="git commit"

function git_COMMIT(){
    git add $@ && git commit
}
alias gC="git_COMMIT"

alias gp="git push"
alias gps="git push"
alias gP="git pull"
alias gpl="git pull"
alias gm="git merge"

#------------------------------------------------------------------------------
# vim: filetype=bash:
