#!/usr/bin/env bash

if [ -d ~/.local/share/bash-completion ]; then
  for completion in $HOME/.local/share/bash-completion/*; do
    [ -f $completion ] && . $completion 2> /dev/null
  done; unset completion
fi

#------------------------------------------------------------------------------

. $HOME/.config/shell/bash/ohmybashrc.bash
. $HOME/.config/shell/shrc.sh

#------------------------------------------------------------------------------

export BASH_SILENCE_DEPRECATION_WARNING=1
export MAILCHECK=0
export TMPDIR=$HOME/.cache/bash

shopt -s cmdhist histappend histverify
shopt -s checkwinsize
shopt -s dotglob extglob nocaseglob nocasematch nullglob
shopt -s autocd hostcomplete progcomp_alias
