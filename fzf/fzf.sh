#!/usr/bin/env bash
# shellcheck disable=SC1090 # SUPPRESS: `Shellcheck can't follow non-constant source. Use a directive to specify location.`

# ----------------------------------------------------------------------------

FZF_BIN=$(which fzf) || return 1
CURRENT_SHELL=$(ps -p $$ -oargs= | sed -E "s#.*[-/]##")

eval "$(cat "${FZF_BIN/bin/opt}/shell/"*".${CURRENT_SHELL}")"

# ----------------------------------------------------------------------------

which fd >/dev/null && export FZF_DEFAULT_COMMAND=(
  "fd"
  "--type=file"
  "--follow"
)

[ "${#FZF_DEFAULT_COMMAND}" -eq 0 ] && export FZF_DEFAULT_COMMAND=(
  "find ."
  "-not -type d"
  "2>/dev/null"
)

# ----------------------------------------------------------------------------

which bat >/dev/null && BAT_COMMAND=(
  "bat"
  "--color=always"
  "--line-range :\$LINES"
)

export FZF_DEFAULT_OPTS=(
  "--multi"
  "--cycle"
  "--reverse"
  "--border rounded"
  "--height=100%"
  "--preview '[[ \$(file --mime-type {}) =~ text ]] && ${BAT_COMMAND:-cat} {}'"
)

# ----------------------------------------------------------------------------

export FZF_COMPLETION_TRIGGER="~~"

export FZF_CTRL_T_OPTS=${FZF_CTRL_T_OPTS:-${FZF_DEFAULT_OPTS[@]}}
export FZF_CTRL_T_COMMAND=${FZF_CTRL_T_COMMAND:-${FZF_DEFAULT_COMMAND[@]}}

export FZF_CTRL_R_OPTS=${FZF_CTRL_R_OPTS:-${FZF_DEFAULT_OPTS[@]:0:-1}}
export FZF_CTRL_R_COMMAND=${FZF_CTRL_R_COMMAND:-${FZF_DEFAULT_COMMAND[@]}}

# ----------------------------------------------------------------------------

if [ "${CURRENT_SHELL}" = "zsh" ]; then
    bindkey "^F" fzf-file-widget 
fi

# if [ "${CURRENT_SHELL}" = "bash" ]; then
# fi

unset FZF_BIN BAT_COMMAND
