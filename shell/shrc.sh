# RC\SOURCE FILES -------------------------------------------------------------

source $HOME/.config/shell/aliasrc.sh

# HISTORY MANAGEMENT ----------------------------------------------------------

export APPEND_HISTORY
export SHARE_HISTORY
export HIST_VERIFY
export HISTFILE="$HOME/.local/share/${SHELL/*\//}/${SHELL/*\//}_history"

export LESSHISTFILE=/dev/null

#------------------------------------------------------------------------------

COMPLETION_HOME=$XDG_DATA_HOME/${SHELL/*\//}/completion
for COMPLETION_FILE in $(find $COMPLETION_HOME -type f); do
    source $COMPLETION_FILE
done

# TMUX ON SHELL START-UP ------------------------------------------------------

[[ $(command -v tmux) ]] && [ -z $TMUX ] && exec tmux

#------------------------------------------------------------------------------
# vim: filetype=bash:
