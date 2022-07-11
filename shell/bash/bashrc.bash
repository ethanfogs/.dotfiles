source $HOME/.shrc

#{ SHOPT\SET }----------------------------------------------------------------

export BASH_SILENCE_DEPRECATION_WARNING=1
shopt -s cmdhist histappend histverify
shopt -s checkwinsize dotglob extglob nocaseglob nocasematch nullglob

#{ PROMPT }-------------------------------------------------------------------

export PS1="[ \u@\H : \w ]\n > "

#{ IMPORT COMMAND-LINE [TOOLS, UTILS] }---------------------------------------

source /opt/homebrew/completions/bash/brew

BASH_COMPLETIONS=$HOME/.config/shell/bash/completions
source $BASH_COMPLETIONS/.fzf.bash
source $BASH_COMPLETIONS/alacritty.bash
