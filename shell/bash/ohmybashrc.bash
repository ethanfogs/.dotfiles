#!/usr/bin/env bash

export OSH=$HOME/.local/share/bash/oh-my-bash

[ ! -d $OSH ] && git clone https://github.com/ohmybash/oh-my-bash $OSH

export OMB_USE_SUDO="false"
export CASE_SENSITIVE="false"
export ENABLE_CORRECTION="true"
export DISABLE_LS_COLORS="false"
export COMPLETION_WAITING_DOTS="true"
export OSH_THEME="powerline"

aliases=()
plugins=(git)
completions=(
  git
  gh
  ssh
)

which aws      >/dev/null && completions+=(awscli)
which brew     >/dev/null && completions+=(brew)
which defaults >/dev/null && completions+=(defaults)
which docker   >/dev/null && completions+=(docker)
which go       >/dev/null && completions+=(go) && plugins+=(goenv)
which make     >/dev/null && completions+=(makefile)
which npm      >/dev/null && completions+=(npm nvm)
which ptyhon3  >/dev/null && completions+=(pip3) && plugins+=(pyenv)
which tmux     >/dev/null && completions+=(tmux)

export aliases plugins completions

. $OSH/oh-my-bash.sh

unset aliases; unset plugins; unset completions

[ -f ~/.osh-update ] && rm ~/.osh-update
