#!/usr/bin/env zsh

# ============================================================================

export ZSH=~/.local/share/zsh/oh-my-zsh

[ ! -d $ZSH ] && git clone https://github.com/ohmyzsh/ohmyzsh $ZSH

# OH-MY-ZSH PLUGINS ==========================================================

plugins=(
  cp #`cpv` => a better version of `cp` that utilizes rsync
  vi-mode
  colored-man-pages
  gnu-utils
  # github
  # git-extras
  # git-auto-fetch
  web-search #query search engines from cli
  # direnv
  # bgnotify
  # shell-proxy
)

custom_plugins=(
  zsh-users/zsh-completions
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
  hlissner/zsh-autopair
)

for plugin in $custom_plugins; do
  if [ ! -d $ZSH/custom/plugins/${plugin/*\/} ]; then
    git clone https://github.com/$plugin $ZSH/custom/plugins/${plugin/*\/}
  fi
  plugins+=(${plugin/*\/})
done
unset custom_plugins

# OH-MY-ZSH AUTO-COMPLETIONS =================================================

plugins+=(
  gitfast # completions for `git`
  gh      # completions for `gh` (github-cli)
  mosh    # completions for ssh hostnames
)

which aws      >/dev/null && plugins+=(aws)
which bw       >/dev/null && plugins+=(rbw) #completions for `bw` (bitwarden-cli)
which docker   >/dev/null && plugins+=(docker docker-machine docker-compose)
which fd       >/dev/null && plugins+=(fd ripgrep ag)
which fzf      >/dev/null && plugins+=(fzf)
which go       >/dev/null && plugins+=(golang gb) #completions+build-tool for goloang 
which httpie   >/dev/null && plugins+=(httpie)
which mongocli >/dev/null && plugins+=(mongocli)
which node     >/dev/null && plugins+=(node npm yarn)
which rustc    >/dev/null && plugins+=(rust)
which apt      >/dev/null && plugins+=(debian)
which pacman   >/dev/null && plugins+=(archlinux)

if [ "$(uname)" = "Darwin" ]; then
  custom_completion=(
    nilsonholger/osx-zsh-completions
  )

  for completion in $custom_completion; do
    if [ ! -d $ZSH/custom/plugins/${completion/*\/} ]; then
      git clone https://github.com/$completion $ZSH/custom/plugins/${completion/*\/}
    fi
    fpath+=($ZSH/custom/plugins/${completion/*\/})
  done

  unset custom_completion; unset completion
fi

#=============================================================================

export plugins
export ZSH_COMPDUMP=~/.cache/zsh/zcompdump
export ZSH_THEME="agnoster"

. $ZSH/oh-my-zsh.sh

unset plugins
