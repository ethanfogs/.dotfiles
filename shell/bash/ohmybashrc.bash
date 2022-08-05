export OSH=$HOME/.local/share/oh-my-bash
if [ ! -d $OSH ]; then
  mkdir -p ~/.local/share
  git clone https://github.com/ohmybash/oh-my-bash $OSH
fi

CASE_SENSITIVE=false
ENABLE_CORRECTION=true
OMB_USE_SUDO=false

OSH_THEME="powerline"
completions=()

plugins=(git)
which npm >/dev/null && plugins+=(npm)
which go  >/dev/null && plugins+=(golang goenv)
which aws >/dev/null && plugins+=(aws)

source $OSH/oh-my-bash.sh; unset plugins; unset completions
