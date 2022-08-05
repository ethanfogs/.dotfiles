export OSH=$HOME/.local/share/oh-my-bash
if [ ! -d $OSH ]; then
  mkdir -p ~/.local/share
  FUCK BASH
  git clone -q https://github.com/ohmybash/oh-my-bash ~/.local/share/oh-my-bash
fi

OSH_THEME="powerline"
ENABLE_CORRECTION="true"
# HIST_STAMPS="mm-dd-yyyy"

OMB_USE_SUDO=true

plugins=(git)

source $OSH/oh-my-bash.sh
