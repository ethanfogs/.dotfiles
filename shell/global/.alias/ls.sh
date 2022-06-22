LS_DEFAULT_PROG=${"$(command -v exa)":-/bin/ls}
LS_DEFAULT_ARGS='-LF --color=auto'
LS_DEFAULT_COMMAND="${LS_DEFAULT_PROG} ${LS_DEFAULT_ARGS}"

#-----------------------------------------------------------------------------

alias ls="${LS_DEFAULT_COMMAND} --git-ignore"
alias Ls="${LS_DEFAULT_COMMAND} -$a"

alias ll="${LS_DEFAULT_COMMAND} -l --git-ignore"
alias lL="${LS_DEFAULT_COMMAND} -la"
alias Ll="${LS_DEFAULT_COMMAND} -lR --git-ignore"
alias LL="${LS_DEFAULT_COMMAND} -laR"

alias la="${LS_DEFAULT_COMMAND} -a"
alias lA="${LS_DEFAULT_COMMAND} -aR"
