#!/usr/bin/env bash

FZF_BIN=$(which fzf) || return 1
CURRENT_SHELL=$(ps $$ -oargs= | sed "s/.*[-/]//")

. "${FZF_BIN/bin/opt}/shell/completion.${CURRENT_SHELL}"
. "${FZF_BIN/bin/opt}/shell/key-bindings.${CURRENT_SHELL}"

#------------------------------------------------------------------------------

FZF_FIND="find . -type file -follow 2>/dev/null"
which fd >/dev/null && FZF_FIND="fd --type=file --follow --hidden"

which lsd >/dev/null && FZF_LS="lsd"
FZF_LS="${FZF_LS:-ls} -AF"

which bat >/dev/null && FZF_CAT="bat --color=always --theme=Dracula"
FZF_CAT="${FZF_CAT:-cat}"

FZF_BASE_OPTS="--multi --cycle --sort --reverse --border=rounded --height=100%"
FZF_PREVIEW_OPTS="--preview='
  [ -d {} ] && $FZF_LS  {} && return 0;
  [ -e {} ] && $FZF_CAT {} && return 0;
' $FZF_BASE_OPTS"

#------------------------------------------------------------------------------

export FZF_DEFAULT_COMMAND="$FZF_FIND"
export FZF_DEFAULT_OPTS="$FZF_PREVIEW_OPTS"

export FZF_CTRL_R_COMMAND="fzf-history-widget"
export FZF_CTRL_R_OPTS="$FZF_BASE_OPTS"

export FZF_CTRL_T_COMMAND="$FZF_FIND"
export FZF_CTRL_T_OPTS="$FZF_PREVIEW_OPTS"

#------------------------------------------------------------------------------

case "${CURRENT_SHELL}" in
  zsh)
    bindkey "^F" fzf-file-widget
    ;;
  bash)
    ;;
esac

#------------------------------------------------------------------------------

unset FZF_BIN FZF_FIND FZF_BASE_OPTS FZF_PREVIEW_OPTS
