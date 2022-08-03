# FILE-SYSTEM - READING -------------------------------------------------------

[[ $(command -v bat) ]]  && alias cat='bat'
[[ $(command -v tree) ]] && alias tree='tree -C'

# FILE-SYSTEM - WRITING -------------------------------------------------------

alias mkdir='mkdir -p'

mcd(){
    /bin/mkdir -p $1 && cd $1
}

chx(){
    [ -x $1 ] && chmod -x $1 || chmod +x $1
}

# TEXT EDITOR -----------------------------------------------------------------

alias e=${EDITOR:-/usr/bin/vim}

# GIT -------------------------------------------------------------------------

alias gss='[[ $(git status) ]] && $EDITOR -c "Git | bd 1"'
alias gs="git status --short"
alias gl="git log --oneline --graph"
alias gb="git branch -a"
alias gco="git checkout -b"
alias gch="git checkout"
alias ga="git add"
alias gA="git add ."
alias gd="git diff --minimal"
alias gst="git stash"
alias gc="git commit"
alias gC="git add . && git commit"
alias gp="git push"
alias gP="git pull"

#------------------------------------------------------------------------------

[[ $(command -v python3) ]] && alias python='python3'

#------------------------------------------------------------------------------

alias su='/usr/bin/su -l'
alias reboot='sudo /sbin/reboot'

if [ $(uname) = "Darwin" ]; then
    alias sysadminctl='sudo /usr/sbin/sysadminctl'
elif [ $(uname) = "Linux" ]; then
    alias apt='sudo apt -y'
    alias apt-get='sudo apt-get -y'
fi

#------------------------------------------------------------------------------
# vim: filetype=bash:
