if [ $(uname -s) = "Darwin" ]; then
  if ! which brew >/dev/null; then
    git clone -q https://github.com/Homebrew/brew ~/.local/homebrew
    ~/.local/homebrew/bin install bash-completions@2
    source ~/.bash_profile
  fi
  source $HOME/.local/etc/profile.d/bash_completion.sh
fi

source $HOME/.config/shell/bash/ohmybashrc.bash
source $HOME/.config/shell/shrc.sh

export BASH_SILENCE_DEPRECATION_WARNING=1
shopt -s cmdhist histappend histverify
shopt -s checkwinsize dotglob extglob nocaseglob nocasematch nullglob
