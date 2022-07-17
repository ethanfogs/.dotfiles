[ $SHLVL -gt 1 ] && return

[ $(uname -p) = "arm" ] && PATH="$PATH:/opt/homebrew/bin"

PATH="$PATH:$HOME/.local/bin"

export PATH

#------------------------------------------------------------------------------

export XDG_CONFIG_HOME=$HOME/.config
export XDG_BIN_HOME=$HOME/.local/bin
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

#------------------------------------------------------------------------------

export EDITOR=${$(command -v nvim):-/usr/bin/vim}
export BROWSER='firefox'

# vim: filetype=bash:
