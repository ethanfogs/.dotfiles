source $HOME/.shrc
source $HOME/.config/shell/zsh/oh-my-zshrc.zsh

#------------------------------------------------------------------------------

if [ $(uname) = "Darwin" ]; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit && compinit

zstyle ':completion:*' menu select
zmodload zsh/complist

_comp_opts=(globdots)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
