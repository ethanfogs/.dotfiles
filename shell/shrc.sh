# TMUX ON SHELL START-UP ------------------------------------------------------

[[ $(command -v tmux) && -z $TMUX && -z $SSH_CLIENT ]] && exec tmux

# RC\SOURCE FILES -------------------------------------------------------------

source $HOME/.config/shell/aliasrc.sh

# HISTORY MANAGEMENT ----------------------------------------------------------

export APPEND_HISTORY
export SHARE_HISTORY
export HIST_VERIFY
export HISTFILE="$HOME/.local/share/${SHELL/*\//}/${SHELL/*\//}_history"

export LESSHISTFILE=/dev/null

#------------------------------------------------------------------------------
# vim: filetype=bash:
