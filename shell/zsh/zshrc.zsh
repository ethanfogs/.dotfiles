plugins=(
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-syntax-highlighting
    hlissner/zsh-autopair
)

for plugin in $plugins; do
  if [ ! -d ~/.local/share/${plugin/*\/} ]; then
    git clone -q https://github.com/$plugin ~/.local/share/${plugin/*\/}
  fi

  source ~/.local/share/${plugin/*\/}/${plugin/*\/}.zsh 2> /dev/null \
    || source ~/.local/share/${plugin/*\/}/${plugin/*\/}.plugin.zsh
done; unset plugins && unset plugin

if [ $(uname) = "Darwin" ]; then
  if ! which brew >/dev/null; then
    mkdir -p ~/.local/share/zsh/site-functions
    git clone -q https://github.com/Homebrew/brew ~/.local/homebrew
    ln -sf ~/.local/homebrew/completions/zsh/_brew ~/.local/share/zsh/site-functions/
  fi
  fpath+=(~/.local/share/zsh/site-functions)
  autoload -Uz compinit; compinit -d ~/.cache/zsh/zcompdump
  export HOMEBREW_CASK_OPTS="-f --no-quarantine --appdir=~/Applications"
fi

#-----------------------------------------------------------------------------

source $HOME/.config/shell/zsh/ohmyzshrc.zsh
source $HOME/.config/shell/shrc.sh

FIGNORE="$FIGNORE:esktop:Trash:ibrary:ictures:terminfo"

setopt dotglob extendedglob
setopt nullglob cshnullglob  # if no completion for current context, dont throw error
setopt menucomplete # tab completion on first tab hit
setopt chaselinks   # go to actual symlink dir rather in cd
setopt nobeep

bindkey "^H" vi-cmd-mode
bindkey "^K" up-history
bindkey "^J" down-history
