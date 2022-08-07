#!/usr/bin/env zsh

plugins=(
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
  hlissner/zsh-autopair
)

for plugin in $plugins; do
  if [ ! -d ~/.local/share/${plugin/*\/} ]; then
    git clone https://github.com/$plugin ~/.local/share/${plugin/*\/}
  fi

  source ~/.local/share/${plugin/*\/}/${plugin/*\/}.zsh 2>/dev/null \
    || source ~/.local/share/${plugin/*\/}/${plugin/*\/}.plugin.zsh
done
unset plugin && unset plugins

if [ "$(uname)" = "Darwin" ] && which brew >/dev/null; then
  if [ ! $(echo $FPATH | grep $HOME/.local/share/zsh/site-functions) ]; then
    fpath+=($HOME/.local/share/zsh/site-functions)
  fi
  autoload -Uz compinit; compinit -d ~/.cache/zsh/zcompdump
  export HOMEBREW_CASK_OPTS="-f --no-quarantine --appdir=~/Applications"
fi

#-----------------------------------------------------------------------------

source $HOME/.config/shell/zsh/ohmyzshrc.zsh
source $HOME/.config/shell/shrc.sh

setopt dotglob extendedglob
setopt nullglob cshnullglob  #if no completion for current context, dont throw error
setopt menucomplete          #tab completion on first tab hit
setopt chaselinks            #go to actual symlink dir rather in cd
setopt nobeep
setopt histappend

bindkey "^H" vi-cmd-mode
bindkey "^K" up-history
bindkey "^J" down-history
