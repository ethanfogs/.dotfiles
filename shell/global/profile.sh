PATH="$PATH:$HOME/.loca/bin:$HOME/.opt/homebrew/bin"

export PATH

#------------------------------------------------------------------------------

export XDG_BIN_HOME=$HOME/.bin
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

#------------------------------------------------------------------------------

export HISTFILE="$XDG_DATA_HOME/${SHELL//*\//}_history"
export HISTSIZE=
export SHARE_HISTORY
export HIST_VERIFY

#------------------------------------------------------------------------------

export EDITOR=${$(command -v nvim):-/usr/bin/vim}
export BROWSER='firefox'

#------------------------------------------------------------------------------
# vim: filetype=bash:
