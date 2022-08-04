# TMUX ON SHELL START-UP ------------------------------------------------------

if which tmux >/dev/null && [ -z $TMUX ] && [ -z $SSH_CLIENT ]; then
  exec tmux
fi

# RC\SOURCE FILES -------------------------------------------------------------

source $HOME/.config/shell/aliasrc.sh

# HISTORY MANAGEMENT ----------------------------------------------------------

# export SHARE_HISTORY
export HIST_VERIFY
export HISTFILE="$HOME/.local/share/${SHELL/*\//}/${SHELL/*\//}_history"

export LESSHISTFILE=/dev/null

#------------------------------------------------------------------------------

if which fzf >/dev/null; then
    if which fd >/dev/null; then
        export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
    else
        export FZF_DEFAULT_COMMAND='find . -type f 2> /dev/null'
    fi
    FZF_PREVIEW="'--preview=[ -f {} ] && cat {}'"
    export FZF_DEFAULT_OPTS="--multi --cycle --reverse --border=rounded $FZF_PREVIEW"
fi

#------------------------------------------------------------------------------
# vim: filetype=bash:
