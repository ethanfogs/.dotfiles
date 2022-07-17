# RC\SOURCE FILES -------------------------------------------------------------

source $HOME/.config/shell/aliasrc.sh

# HISTORY MANAGEMENT ----------------------------------------------------------

export APPEND_HISTORY
export SHARE_HISTORY
export HIST_VERIFY
export HISTFILE="$HOME/.local/share/${SHELL/*\//}/${SHELL/*\//}_history"

export LESSHISTFILE=/dev/null

#------------------------------------------------------------------------------

COMPLETION_HOME=/usr/local/share/${SHELL/*\//}/completion
for COMPLETION_FILE in $(find $COMPLETION_HOME -type f); do
    source $COMPLETION_FILE
done

# FZF -------------------------------------------------------------------------

#export FZF_DEFAULT_OPTS="--multi --cycle --reverse --border=rounded --preview='[[ ! -d {} ]] && bat {}'"
#export FZF_DEFAULT_COMMAND="fzf ${FZF_DEFAULT_OPTS}"
#export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

# TMUX ON SHELL START-UP ------------------------------------------------------

[ $(command -v tmux) ] && [ -z $TMUX ] && exec tmux

#------------------------------------------------------------------------------
# vim: filetype=bash:
