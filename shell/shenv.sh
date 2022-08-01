export path=( {/usr/,~/.}local/{s,}bin $path )

export XDG_CONFIG_HOME=$HOME/.config
export XDG_BIN_HOME=$HOME/.local/bin
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export EDITOR=$(command -v nvim || command -v vim)
export BROWSER='firefox'
[ $(command -v vimr) ] && export VISUAL='vimr'
