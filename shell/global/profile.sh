PATH="$PATH:$HOME/.bin:$HOME/.opt/homebrew/bin"
PATH="$PATH:$HOME/.cargo/bin"
#PATH="$PATH:$HOME/.opt/homebrew/bin/lua@5.3/bin"

export PATH

#------------------------------------------------------------------------------

export XDG_BIN_HOME=$HOME/.local/bin
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
#export VISUAL="${EDITOR}"
#export TERMINAL="${TERM}"

#------------------------------------------------------------------------------
# vim: filetype=bash:
