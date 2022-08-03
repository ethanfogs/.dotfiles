# OHMYZSH CONFIG -------------------------------------------------------------

ZSH=~/.local/share/ohmyzsh

if [ ! -d $ZSH ]; then
    git clone --quiet https://github.com/ohmyzsh/ohmyzsh $ZSH
    source $0
fi

# COMPLETIONS ----------------------------------------------------------------

completions+=(tmux fzf fd httpie ripgrep ag)
completions+=(node npm yarn rust aws docker{,-compose,-machine} mongocli)
for completion in $completions; do
    which $completion > /dev/null && plugins+=($completion)
done;
unset completions && unset completion

[ $(command -v go) ] && plugins+=(golang gb)
[ $(command -v bw) ] && plugins+=(rbw)

ZSH_COMPDUMP=~/.cache/zsh/zcompdump-$SHORT_HOST-$ZSH_VERSION
autoload -Uz compinit && compinit -d ~/.cache/zsh/zcompdump

# PLUGINS --------------------------------------------------------------------

plugins+=(vi-mode colored-man-pages gnu-utils compleat gitfast) #essentials
# plugins+=(github git-extras) #git
# plugins+=(urltools web-search encode64 jsontools) #web-based
# plugins+=(direnv bgnotify git-auto-fetch shell-proxy torrent z) #experiment with

ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh && plugins=

# delete this completion pattern - it colides with some that ohmyzsh imports
[ $(command -v mcd) ] && compdef -d mcd
