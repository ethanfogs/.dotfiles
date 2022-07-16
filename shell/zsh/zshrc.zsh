source $HOME/.config/shell/shrc.sh

#------------------------------------------------------------------------------

[ $(uname) = "Darwin" ] && FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# OH-MY-ZSH CONFIG ------------------------------------------------------------

autoload -Uz compinit && compinit -d $XDG_DATA_HOME/zsh/zcompdump

export ZSH=/usr/local/share/oh-my-zsh
ZSH_COMPDUMP="$XDG_DATA_HOME/zsh/zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
ZSH_THEME="agnoster" #fav themes: agnoster, cloud, darkblood, edvardm, fox, jonathan, trapd00r
source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' menu select
zmodload zsh/complist

_comp_opts=(globdots)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
