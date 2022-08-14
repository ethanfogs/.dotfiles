#!/usr/bin/env bash

. ~/.config/shell/bash/ohmybashrc.bash
. ~/.config/shell/shrc.sh

export BASH_SILENCE_DEPRECATION_WARNING=1
export MAILCHECK=0
export TMPDIR="$HOME/.cache/bash"

shopt -s cmdhist histappend histverify
shopt -s checkwinsize
shopt -s dotglob
shopt -s extglob
shopt -s nocaseglob
shopt -s nocasematch
shopt -s nullglob
shopt -s hostcomplete
shopt -s autocd
shopt -s progcomp_alias
