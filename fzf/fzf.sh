#!/usr/bin/env bash

FZF_BIN=$(which fzf) || return 1
__SHELL__=$(ps $$ -oargs= | sed "s/.*[-/]//")

eval "$(cat "${FZF_BIN/bin/opt}/shell/"*".${__SHELL__}" 2>/dev/null)"

#-------------------------------------------------------------------------------

FZF_BASE_OPTS=(
  "--multi"
  "--cycle"
  "--sort"
)

FZF_LAYOUT_OPTS=(
  "${FZF_BASE_OPTS[@]}"
  "--layout=reverse-list"
  "--border=rounded"
  "--height=100%"
)

FZF_PREVIEW_OPTS=(
  "${FZF_LAYOUT_OPTS[@]}"
  "--preview='"
  "[ -f {} ] && ${FZF_CAT[@]:-cat}  {} && return;"
  "[ -d {} ] && ${FZF_LS[@]:-ls -l} {} && return;'"
)

FZF_FIND=(
  "find ."
  "-not -type d"
  "2>/dev/null"
)

which fd >/dev/null && export FZF_FIND=(
  "fd"
  "--type=file"
  "--follow"
)

which bat >/dev/null && FZF_CAT=(
  "bat"
  "--color=always"
)

export FZF_CTRL_R_OPTS=("${FZF_LAYOUT_OPTS[@]}")
export FZF_CTRL_T_OPTS=("${FZF_PREVIEW_OPTS[@]}")

#-------------------------------------------------------------------------------

case "${__SHELL__}" in
  zsh)
    bindkey "^F" fzf-file-widget
    ;;
  bash)
    ;;
esac
