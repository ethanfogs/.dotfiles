source $HOME/.config/shell/shrc.sh

#------------------------------------------------------------------------------

setopt dotglob extendedglob nomatch menucomplete
unsetopt BEEP

#------------------------------------------------------------------------------

if [ $(uname) = "Darwin" ]; then
    FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"
    # ignore completions for macOS default $HOME directories that I never use
    FIGNORE="sers:cache:ibrary:ublic:ictures:usic:ovies:esktop:ocuments:Trash"
    [ -d $XDG_DATA_HOME/zsh-autosuggestions ] \
        && source $XDG_DATA_HOME/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# OH-MY-ZSH CONFIG ------------------------------------------------------------

autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump

ZSH=$XDG_DATA_HOME/zsh/plugins/oh-my-zsh
[ ! -d $ZSH ] && return

export ZSH

ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
ZSH_THEME="agnoster"
plugins=(vi-mode)
source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' menu select
zmodload zsh/complist

_comp_opts=(globdots)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
