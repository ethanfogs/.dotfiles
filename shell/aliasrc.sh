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

if [[ $(command -v nvim) ]]; then
    alias gss="git status 1> /dev/null && nvim -c 'G | bdelete 1'"
fi
alias gs="git status --short"
alias gS="git status"
alias gl="git log --oneline"
alias gL="git log"
alias gb="git branch"
alias gco="git checkout"
alias gcb="git checkout -b"
function gsw(){
    [ -n $* ] && git switch $1 || git checkout -
}
alias ga="git add"
alias gA="git add ."
alias grm="git rm"

alias gd="git diff --minimal"

alias gst="git stash"

alias gc="git commit"
alias gC="git add . && git commit"

alias gp="git push"
alias gP="git pull"

alias gm="git merge"

#------------------------------------------------------------------------------

function nvim_man(){
    nvim -c "Man $1 | only"
}

[[ $(command -v nvim) ]] && alias man='nvim_man'

#------------------------------------------------------------------------------

alias python=$(command -v python3)
alias py=$(command -v python3)

#------------------------------------------------------------------------------


if [[ $(command -v fzf) ]]; then 
    #FZF_DEFAULT_PREVIEW="--preview='[[ ! -d {} ]] && bat {}'"
    FZF_DEFAULT_OPTS="--multi --cycle --reverse --border=rounded"
    alias fzf="fzf $FZF_DEFAULT_OPTS"
fi

#------------------------------------------------------------------------------
# vim: filetype=bash:
