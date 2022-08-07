#!/bin/sh

mkdir -p ~/.config ~/.cache ~/.local/share ~/.local/state ~/.local/bin

for rc_dir in *; do
  [ -h "$HOME/.config/$rc_dir" ] && unlink "$HOME/.config/$rc_dir"
  ln -sfv "$(pwd)/$rc_dir" "$HOME/.config/$rc_dir"
done
unset rc_dir

set -- "shell/profile.sh" "shell/inputrc" \
       "shell/bash/bash_profile.bash" "shell/bash/bashrc.bash" \
       "shell/zsh/zprofile.zsh" "shell/zsh/zshrc.zsh" \
       "vim"

for rc_link in "$@"; do
  linkname="$(basename $rc_link | sed 's/\..*//g')"
  [ -h "$HOME/.$linkname" ] && unlink "$HOME/.$linkname"
  ln -sfv "$HOME/.config/$rc_link" "$HOME/.$linkname"
done
unset rc_links; unset rc_link; unset linkname

exec $(ps -p $$ -oargs= | tr -d '-') #returns name of the current shell
