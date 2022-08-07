#!/usr/bin/env bash

export OSH=$HOME/.local/share/oh-my-bash
if [ ! -d $OSH ]; then
  mkdir -p ~/.local/share
  git clone https://github.com/ohmybash/oh-my-bash $OSH
fi

export CASE_SENSITIVE=false
export ENABLE_CORRECTION=true
export OMB_USE_SUDO=false
export OSH_THEME="powerline"
export completions=()
plugins=(git)
which npm >/dev/null && plugins+=(npm)
which go  >/dev/null && plugins+=(golang goenv)
which aws >/dev/null && plugins+=(aws)

. $OSH/oh-my-bash.sh; unset plugins; unset completions
