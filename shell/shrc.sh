# RC\SOURCE FILES -------------------------------------------------------------

source $HOME/.config/shell/aliasrc.sh

# HISTORY MANAGEMENT ----------------------------------------------------------

export LESSHISTFILE=/dev/null
export HISTFILE="$XDG_DATA_HOME/${SHELL/*\//}/${SHELL/*\//}_history"
export HISTSIZE=
export SHARE_HISTORY
export HIST_VERIFY

# FZF -------------------------------------------------------------------------

#export FZF_DEFAULT_OPTS="--multi --cycle --reverse --border=rounded --preview='[[ ! -d {} ]] && bat {}'"
#export FZF_DEFAULT_COMMAND="fzf ${FZF_DEFAULT_OPTS}"
#export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

#------------------------------------------------------------------------------

[ -z $TMUX ] && exec tmux
