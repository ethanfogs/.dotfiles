#!/bin/sh

# TMUX ON SHELL START-UP ------------------------------------------------------

if which tmux >/dev/null && [ -z "$TMUX" ] && [ -z "$SSH_CLIENT" ]; then
  tmux -f ~/.config/tmux/tmux.conf
fi

# RC\SOURCE FILES -------------------------------------------------------------

. "$HOME/.config/shell/aliasrc.sh" 2> /dev/null

# ----------------------------------------------------------------------------

CURRENT_SHELL="$(basename "$(ps -p $$ -oargs= | tr -d '-')")"

# HISTORY MANAGEMENT ----------------------------------------------------------

export HISTCONTROL=ignoredups
export HISTTIMEFORMAT=""
export HISTFILE="$HOME/.local/share/${CURRENT_SHELL}/${CURRENT_SHELL}_history"
export LESSHISTFILE=/dev/null

#------------------------------------------------------------------------------

FIGNORE="pplications:esktop:Trash:ibrary:ovies:usic:ictures:ublic:terminfo"

#------------------------------------------------------------------------------

if [ "$(uname)" = "Darwin" ] && ! which brew >/dev/null; then
  mkdir -p ~/.local/share ~/.local/bin
  git clone https://github.com/Homebrew/brew ~/.local/homebrew
  ln -sfv ~/.local/homebrew/bin/brew ~/.local/bin/
  if [ "${CURRENT_SHELL}" = "zsh" ]; then
    mkdir -p ~/.local/share/zsh/site-functions
    ln -sfv ~/.local/homebrew/completions/zsh/_brew ~/.local/share/zsh/site-functions/_brew
  fi
fi

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

unset CURRENT_SHELL
