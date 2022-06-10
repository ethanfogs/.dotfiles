export ZDOTDIR=$HOME/.config/shell/zsh

unix_bin_dirs=( {/{,usr{,/local}/},$HOME/.local/}{,s}bin )
opt_bin_dirs=$(find /opt -name "*bin" -type d -maxdepth 2 2> /dev/null)
lua_default_version=/opt/homebrew/opt/lua@5.3/bin
cargo_bin_home=$HOME/.cargo/bin

#------------------------------------------------------------------------------

_path=( $opt_bin_dirs $unix_bin_dirs $lua_default_version $cargo_bin_home )
export PATH=${"${_path}"//[[:space:]]/:}:.

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

export VIM_DEFAULT_PROG=${$(command -v nvim):-/usr/bin/vim}
export EDITOR=${VIM_DEFAULT_PROG}
export BROWSER='firefox'
#export VISUAL="${EDITOR}"
#export TERMINAL="${TERM}"

#------------------------------------------------------------------------------

#[ -n $PS1 ] && source $HOME/.${SHELL//*\//}rc
#------------------------------------------------------------------------------
# vim: filetype=bash:
