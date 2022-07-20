source $HOME/.config/shell/shrc.sh

#{ SHOPT\SET }----------------------------------------------------------------

export BASH_SILENCE_DEPRECATION_WARNING=1
shopt -s cmdhist histappend histverify
shopt -s checkwinsize dotglob extglob nocaseglob nocasematch nullglob

# OH-MY-BASH ------------------------------------------------------------------

OSH=$XDG_DATA_HOME/bash/plugins/oh-my-bash

[ ! -d $OSH ] && return

export OSH

OSH_THEME="powerline"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true" # display red dots whilst waiting for completion.
DISABLE_UNTRACKED_FILES_DIRTY="false"
HIST_STAMPS="mm-dd-yyyy"

OMB_USE_SUDO=true

completions=(git)
plugins=(git)

source $OSH/oh-my-bash.sh
