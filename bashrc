# ~/.bashrc
#
# - config content for INTERACTIVE bash instances. (sourced @ shell startup)

#{ RC\SOURCE FILES }----------------------------------------------------------

source $HOME/.shellrc

#{ SHOPT\SET }----------------------------------------------------------------

export BASH_SILENCE_DEPRECATION_WARNING=1
#shopt -s cmdhist histappend histverify
#shopt -s checkwinsize dotglob extglob nocaseglob nocasematch nullglob

#{ PROMPT }-------------------------------------------------------------------

export PS1="[ \u@\H : \w ]\n > "

#{ IMPORT COMMAND-LINE [TOOLS, UTILS] }---------------------------------------

source $HOME/.config/bash/completions/.fzf.bash
source $HOME/.config/bash/completions/alacritty.bash

#------------------------------------------------------------------------------
# vim: filetype=bash:
