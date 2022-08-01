source $HOME/.config/shell/shrc.sh

#------------------------------------------------------------------------------

setopt dotglob
setopt extendedglob
setopt menucomplete
setopt nomatch

setopt nobeep
setopt chaselinks #go to actual symlink dir rather in cd
setopt incappendhistory

#------------------------------------------------------------------------------

# ignore completions for macOS default $HOME directories that I never use
FIGNORE="sers:cache:ibrary:ublic:ictures:usic:ovies:esktop:ocuments:Trash"

[[ $(command -v brew) ]] && FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"

# ZSH PLUGINS ------------------------------------------------------------

zsh_plugins=(
    # zsh-autocomplete #buggy when zsh-autosuggestions is also applied
    zsh-autosuggestions
)


for plugin in $zsh_plugins; do
    [ -d $XDG_DATA_HOME/$plugin ] && . "$XDG_DATA_HOME/$plugin/$plugin.zsh"
done

# OH-MY-ZSH CONFIG -----------------------------------------------------------

autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump

[ ! -d $XDG_DATA_HOME/oh-my-zsh ] && return

export ZSH=$XDG_DATA_HOME/oh-my-zsh

ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
ZSH_THEME="agnoster"
plugins=(vi-mode fzf)
source $ZSH/oh-my-zsh.sh
