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

if [[ $(command -v fzf) ]]; then
    if [[ $(command -v fd) ]]; then
        export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
    else
        export FZF_DEFAULT_COMMAND='find . -type f 2> /dev/null'
    fi

    FZF_PREVIEW="'--preview=[ -f {} ] && cat {}'"
    export FZF_DEFAULT_OPTS="--multi --cycle --reverse --border=rounded $FZF_PREVIEW"
fi

#------------------------------------------------------------------------------
# vim: filetype=bash:
