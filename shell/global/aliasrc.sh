source $HOME/.config/shell/global/.alias/ls.sh
source $HOME/.config/shell/global/.alias/git.sh

#-----------------------------------------------------------------------------

alias cat=${$(command -v bat):-/bin/cat}
alias grep='grep --color=auto'

#-----------------------------------------------------------------------------

function mcdir(){ mkdir -p "${1}" && cd "${1}"; }
alias mcd='mcdir'

#-----------------------------------------------------------------------------

alias chx='chmod +x'
alias mkx='chmod +x'

##-----------------------------------------------------------------------------

alias e="${$(command -v nvim):-/usr/bin/vim}"

#-----------------------------------------------------------------------------

function files(){ find ${@:-.} -type f 2> /dev/null | sort; }
function dirs (){ find ${@:-.} -type d 2> /dev/null | sort; }

alias fs='files'
alias ds='dirs'

#------------------------------------------------------------------------------

if [[ $(command -v tree) ]]; then
    TREE_DEFAULT_COMMAND='tree -C --gitignore --dirsfirst'
    alias tree=$TREE_DEFAULT_COMMAND
    alias t=$TREE_DEFAULT_COMMAND
fi
