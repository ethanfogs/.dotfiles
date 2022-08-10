#!/bin/sh

if [ ! "$(echo $PATH | sed 's/:.*//g')" = "$HOME/.local/sbin" ]; then
  export PATH="$HOME/.local/sbin:$HOME/.local/bin:$PATH"
fi

export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state
export XDG_CACHE_HOME=~/.cache

which nvim >/dev/null && export EDITOR=nvim
export BROWSER='firefox'
