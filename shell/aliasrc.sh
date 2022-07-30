# FILE-SYSTEM - READING -------------------------------------------------------

[[ $(command -v bat) ]]  && alias cat='bat'
[[ $(command -v tree) ]] && alias tree='tree -C'

# FILE-SYSTEM - WRITING -------------------------------------------------------

mcd(){
    mkdir -p $1 && cd $1
}

chx(){
    [ -x $1 ] && chmod -x $1 || chmod +x $1
}

# TEXT EDITOR -----------------------------------------------------------------

alias e=${EDITOR:-vim}

# GIT -------------------------------------------------------------------------

alias gss='[[ $(git status) ]] && $EDITOR -c "Git | bd 1"'
alias gs="git status --short"
alias gS="git status"
alias gl="git log --oneline --graph"
alias gb="git branch -a"
alias gch="git checkout"
alias gco="git checkout -b"
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

alias python=$(command -v python3)

#------------------------------------------------------------------------------

google(){
    open "https://google.com/search?q=${*// /+}"
}

#------------------------------------------------------------------------------

if [[ $(nmap -p22 pi 2> /dev/null) =~ "22/tcp open  ssh" ]] && [ ! $HOST = "pi" ]; then
    alias pi='ssh pi'
fi

#------------------------------------------------------------------------------
# vim: filetype=bash:
