#------------------------------------------------------------------------------

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"

#------------------------------------------------------------------------------

export PATH="${PATH}:${HOME}/.bin:${HOME}/.local/bin"

#------------------------------------------------------------------------------

export EDITOR="vim"
export VISUAL="$EDITOR"
export TERMINAL="alacritty"

#------------------------------------------------------------------------------

export HISTFILE=${XDG_STATE_HOME}/.${SHELL//*\//}_history
export HISTSIZE=
export SHARE_HISTORY
export HIST_VERIFY

#------------------------------------------------------------------------------

[ -n "${PS1}" ] && source "${HOME}/.${SHELL//*\//}rc"

#------------------------------------------------------------------------------
# vim: filetype=bash:foldmethod=marker:
