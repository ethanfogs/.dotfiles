source $HOME/.config/shell/shrc.sh

#------------------------------------------------------------------------------

setopt dotglob
setopt extendedglob
setopt menucomplete
setopt nomatch

setopt nobeep
setopt chaselinks #go to actual symlink dir rather in cd

bindkey "^K" vi-cmd-mode

#------------------------------------------------------------------------------

# ignore completions for macOS default $HOME directories that I never use
FIGNORE="sers:cache:ibrary:ublic:ictures:usic:ovies:esktop:ocuments:Trash"

if [[ $(command -v brew) ]]; then
    [ ! -d ~/Applications ] && mkdir -p ~/Applications
    export HOMEBREW_CASK_OPTS="-f --no-quarantine --appdir=~/Applications"
    FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"
fi

# ZSH PLUGINS ------------------------------------------------------------

zsh_plugins=(
    zsh-autosuggestions
    # zsh-autocomplete      # buggy when zsh-autosuggestions is also applied
)

for plugin in $zsh_plugins; do
    [ -d $XDG_DATA_HOME/$plugin ] && source "$XDG_DATA_HOME/$plugin/$plugin.zsh"
done

# OH-MY-ZSH CONFIG -----------------------------------------------------------

autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump

export ZSH=$XDG_DATA_HOME/oh-my-zsh
if [ ! -d $ZSH ]; then
    mkdir -p ~/.local/share
    git clone --quiet https://github.com/ohmyzsh/ohmyzsh $ZSH
fi

ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

ZSH_THEME="agnoster"

plugins=(vi-mode)
[ $(command -v fzf) ] && plugins+=(fzf)
[ $(command -v aws) ] && plugins+=(aws)

source $ZSH/oh-my-zsh.sh

# delete this completion pattern - colides with some that oh-my-zsh imports 🙄
[ $(command -v mcd) ] && compdef -d mcd
