#!/bin/sh

if ! echo "$PATH" | grep "$HOME/.local/bin" >/dev/null; then
  export PATH="$HOME/.local/sbin:$HOME/.local/bin:$PATH"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

which nvim >/dev/null && export EDITOR=nvim
export BROWSER='firefox'
