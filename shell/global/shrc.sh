# RC\SOURCE FILES -------------------------------------------------------------

source ~/.config/shell/global/aliasrc.sh

# HISTORY MANAGEMENT ----------------------------------------------------------
    
export LESSHISTFILE=/dev/null

# FZF -------------------------------------------------------------------------

export FZF_DEFAULT_OPTS="--multi --cycle --reverse --border=rounded"
export FZF_DEFAULT_COMMAND="find . -type f 2> /dev/null | fzf ${FZF_DEFAULT_OPTS}"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

#------------------------------------------------------------------------------

if [[ ${SHLVL} = 1 ]] && [[ $(command -v neofetch) ]]; then neofetch; fi

#------------------------------------------------------------------------------
# vim: filetype=bash:
