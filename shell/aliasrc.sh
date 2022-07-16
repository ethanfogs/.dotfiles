alias ls="ls -FG"
alias ll="ls -lFG"
alias la="ls -aFG"
alias lla="ls -laFG"
alias lal="ls -laFG"

function trash(){
    mv -f $* ~/.Trash
}

#alias rm='trash'

alias mkdir='mkdir -p'
function mcd(){ mkdir -p "${1}" && cd "${1}"; }

alias chx='chmod +x'

alias edit=$EDITOR
alias e=$EDITOR

function files(){ find ${@:-.} -not -type d 2> /dev/null | sort; }
function dirs (){ find ${@:-.} -type d 2> /dev/null | sort; }

alias fs='files'
alias ds='dirs'

alias tree='tree -C'

alias gs="git status"
alias gl="git log --oneline"
alias gbr="git branch"
alias gch="git checkout -b"
alias gsw="git switch"
<<<<<<< HEAD
alias ga="git add"
alias gA="git add ."
=======
alias ga="git add ."
alias gA="git add"
>>>>>>> 5e307baeace70b67dd531769a88895262b3e69b5
alias gc="git commit"
alias gp="git push"
alias gps="git push"
alias gP="git pull"
alias gpl="git pull"
alias gm="git merge"
