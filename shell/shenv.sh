echo $PATH | grep $HOME/.local/bin || path=( {/usr/,~/.}local/{s,}bin $path )
export path

export XDG_CONFIG_HOME=$HOME/.config
export XDG_BIN_HOME=$HOME/.local/bin
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

EDITOR=/usr/bin/vim && which nvim >/dev/null && EDITOR=nvim
export EDITOR
export BROWSER='firefox'

which vimr >/dev/null && export VISUAL='vimr'
