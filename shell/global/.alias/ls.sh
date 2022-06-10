LS_DEFAULT_PROG=${"$(command -v exa)":-/bin/ls}
LS_DEFAULT_ARGS='-FG'
LS_DEFAULT_COMMAND="${LS_DEFAULT_PROG} ${LS_DEFAULT_ARGS}"

[[ "${LS_DEFAULT_PROG}" = '/bin/ls' ]] \
    && LS_MOD_FLAG_ALL='-a' \
    || LS_MOD_FLAG_ALL='-A'

#-----------------------------------------------------------------------------

alias ls="${LS_DEFAULT_COMMAND}"
alias Ls="${LS_DEFAULT_COMMAND} -${LS_MOD_FLAG_ALL}"

alias ll="${LS_DEFAULT_COMMAND} -l"
alias Ll="${LS_DEFAULT_COMMAND} -l"
alias lL="${LS_DEFAULT_COMMAND} -l${LS_MOD_FLAG_ALL}"
alias lL="${LS_DEFAULT_COMMAND} -l${LS_MOD_FLAG_ALL}"

alias la="${LS_DEFAULT_COMMAND} -${LS_MOD_FLAG_ALL}"
alias lA="${LS_DEFAULT_COMMAND} -${LS_MOD_FLAG_ALL}R"
