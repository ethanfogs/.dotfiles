#!/bin/sh

# TMUX ON SHELL START-UP ------------------------------------------------------

if which tmux >/dev/null && [ -z "$TMUX" ] && [ -z "$SSH_CLIENT" ]; then
  tmux -f ~/.config/tmux/tmux.conf
fi

# RC\SOURCE FILES -------------------------------------------------------------

. ~/.config/shell/aliasrc.sh

# ----------------------------------------------------------------------------

CURRENT_SHELL="$(basename "$(ps -p $$ -oargs= | tr -d '-')")"

# HISTORY MANAGEMENT ----------------------------------------------------------

export HISTCONTROL=both
export HISTTIMEFORMAT=""
mkdir -p "$HOME/.local/share/$CURRENT_SHELL"
export HISTFILE="$HOME/.local/share/$CURRENT_SHELL/${CURRENT_SHELL}_history"
export LESSHISTFILE=/dev/null

#------------------------------------------------------------------------------

FIGNORE="pplications:esktop:Trash:ibrary:ovies:usic:ictures:ublic:terminfo"

#------------------------------------------------------------------------------

if [ "$(uname)" = "Darwin" ] && ! which brew >/dev/null; then
  mkdir -p ~/.local/share ~/.local/bin
  git clone https://github.com/Homebrew/brew ~/.local/homebrew
  ln -sfv ~/.local/homebrew/bin/brew ~/.local/bin/
fi

#------------------------------------------------------------------------------

if which fzf >/dev/null; then
  if which fd >/dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
  else
    export FZF_DEFAULT_COMMAND='find . -type f 2> /dev/null'
  fi
  export FZF_DEFAULT_OPTS="--multi --cycle --reverse --border=rounded \
                            --preview='[ -f {} ] && cat {}'"
fi

unset CURRENT_SHELL
