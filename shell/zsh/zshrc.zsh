#!/usr/bin/env zsh

# ============================================================================

[ -r ~/.config/shell/zsh/ohmyzshrc.zsh ] && . ~/.config/shell/zsh/ohmyzshrc.zsh
[ -r ~/.config/shell/shrc.sh ]           && . ~/.config/shell/shrc.sh

# ============================================================================

if ! echo $FPATH | grep ~/.local/share/zsh/site-functions >/dev/null; then
  fpath=(~/.local/share/zsh/site-functions $fpath)
  autoload -Uz compinit && compinit -d ~/.cache/zsh/zcompdump
fi

# ============================================================================

setopt dotglob
setopt extendedglob
setopt menucomplete #tab completion on first tab hit
setopt chaselinks   #go to actual symlink dir rather in cd
setopt histverify
setopt sharehistory
setopt histappend
setopt incappendhistory
setopt noextendedhistory #no timestamping prepending history entries
setopt nobeep

# ============================================================================

bindkey "^H" vi-cmd-mode
bindkey "^K" up-history
bindkey "^J" down-history
