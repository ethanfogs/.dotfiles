#!/usr/bin/env zsh
# OHMYZSH CONFIG -------------------------------------------------------------

export ZSH=~/.local/share/oh-my-zsh
if [ ! -d $ZSH ]; then
  mkdir -p $ZSH
  git clone https://github.com/ohmyzsh/ohmyzsh $ZSH
fi

# COMPLETIONS ----------------------------------------------------------------

omz_completions+=(tmux fzf fd httpie ripgrep ag)
omz_ompletions+=(node npm yarn rust aws docker{,-compose,-machine} mongocli)
for completion in $omz_completions; do
  which $completion >/dev/null && plugins+=($completion)
done; unset omz_completions && unset completion

which go >/dev/null && plugins+=(golang gb)
which bw >/dev/null && plugins+=(rbw)

ZSH_COMPDUMP=~/.cache/zsh/zcompdump
autoload -Uz compinit && compinit -d $ZSH_COMPDUMP

# PLUGINS --------------------------------------------------------------------

plugins+=(vi-mode colored-man-pages gnu-utils compleat gitfast) #essentials
# plugins+=(github git-extras) #git
# plugins+=(urltools web-search encode64 jsontools) #web-based
# plugins+=(direnv bgnotify git-auto-fetch shell-proxy torrent z) #experiment with

ZSH_THEME="agnoster"

. $ZSH/oh-my-zsh.sh; unset plugins
