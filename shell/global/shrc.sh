# RC\SOURCE FILES -------------------------------------------------------------

source $HOME/.config/shell/global/aliasrc.sh

# HISTORY MANAGEMENT ----------------------------------------------------------

export LESSHISTFILE=/dev/null

# FZF -------------------------------------------------------------------------

#export FZF_DEFAULT_OPTS="--multi --cycle --reverse --border=rounded --preview='[[ ! -d {} ]] && bat {}'"
#export FZF_DEFAULT_COMMAND="fzf ${FZF_DEFAULT_OPTS}"
#export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

#------------------------------------------------------------------------------

[[ -z $TERM_PROGRAM ]] && tmux -f ~/.tmux.conf
