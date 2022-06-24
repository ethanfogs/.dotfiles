source $HOME/.shrc

#------------------------------------------------------------------------------

FPATH="$HOME/.opt/homebrew/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select
zmodload zsh/complist

_comp_opts=(globdots)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

#------------------------------------------------------------------------------

export PROMPT="[ %F{49}%n%f%f@%F{190}%M%f : %F{120}%~/%f ]
> "

#------------------------------------------------------------------------------
# vim: filetype=bash:
