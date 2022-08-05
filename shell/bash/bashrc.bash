source $HOME/.config/shell/shrc.sh

#{ SHOPT\SET }----------------------------------------------------------------

export BASH_SILENCE_DEPRECATION_WARNING=1
shopt -s cmdhist histappend histverify
shopt -s checkwinsize dotglob extglob nocaseglob nocasematch nullglob

if [ $(uname -s) = "Darwin" ]; then
  if ! which brew >/dev/null; then
    git clone -q https://github.com/Homebrew/brew ~/.local/homebrew
    ~/.local/homebrew/bin install bash-completions@2
  fi

  source $HOME/.local/etc/profile.d/bash_completion.sh

  # for completion in $HOME/.local/etc/bash_completion.d/*; do
  #   source $completion 2> /dev/null
  # done; unset completion
fi

# OH-MY-BASH ------------------------------------------------------------------

export OSH=$HOME/.local/share/oh-my-bash
if [ ! -d $OSH ]; then
  mkdir -p ~/.local/share
  git clone -q https://github.com/ohmybash/oh-my-bash ~/.local/share/oh-my-bash
fi

OSH_THEME="powerline"
ENABLE_CORRECTION="true"
# HIST_STAMPS="mm-dd-yyyy"

OMB_USE_SUDO=true

plugins=(git)

source $OSH/oh-my-bash.sh
