source $HOME/.config/shell/zsh/ohmyzshrc.zsh
source $HOME/.config/shell/shrc.sh

plugins=(
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-syntax-highlighting
    hlissner/zsh-autopair
)

for plugin in $plugins; do
    if [ ! -d ~/.local/share/${plugin/*\/} ]; then
        git clone https://github.com/$plugin ~/.local/share/${plugin/*\/}
    fi

    source ~/.local/share/${plugin/*\/}/${plugin/*\/}.zsh 2> /dev/null \
        || source ~/.local/share/${plugin/*\/}/${plugin/*\/}.plugin.zsh
done
unset plugins && unset plugin

if [ ! $(command -v brew) ] && [ $(uname) = "Darwin" ]; then
    git clone -q https://github.com/Homebrew/brew ~/.local/homebrew
    export HOMEBREW_CASK_OPTS="-f --no-quarantine --appdir=~/Applications"
fi

#------------------------------------------------------------------------------

FIGNORE="$FIGNORE:esktop:Trash:ibrary:ictures:terminfo"

setopt dotglob extendedglob nomatch
setopt menucomplete
setopt nobeep
setopt chaselinks # go to actual symlink dir rather in cd

bindkey "^H" vi-cmd-mode
bindkey "^K" up-history
bindkey "^J" down-history
