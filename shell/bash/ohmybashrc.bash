#!/usr/bin/env bash

export OSH=$HOME/.local/share/oh-my-bash
if [ ! -d $OSH ]; then
  mkdir -p ~/.local/share
  git clone https://github.com/ohmybash/oh-my-bash $OSH
fi

export OMB_USE_SUDO=false
export CASE_SENSITIVE=false

export ENABLE_CORRECTION=true
export DISABLE_LS_COLORS=false
export COMPLETION_WAITING_DOTS=true

export OSH_THEME="powerline"

export completions=()
export aliases=()
export plugins=(git)

which npm >/dev/null && plugins+=(npm)
which go  >/dev/null && plugins+=(golang goenv)
which aws >/dev/null && plugins+=(aws)

. $OSH/oh-my-bash.sh; unset plugins; unset completions
