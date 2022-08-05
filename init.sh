#!/usr/bin/env bash

mkdir -p ~/.{config,cache,local/{bin,share,state}}

for dir in *; do
  [ -h ~/.config/$dir ] && unlink ~/.config/$dir
  ln -sfv $dir ~/.config/$dir
done

rc_links=(
  shell/profile.sh
  shell/bash/bashrc.bash
  shell/bash/bash_profile.bash
  shell/zsh/zprofile.zsh
  shell/zsh/zshrc.zsh
  shell/inputrc
  vim
)

for rc_link in "${rc_links[@]}"; do
  linkname=$(basename $rc_link | sed 's/\..*//g')
  [ -h ~/.$linkname ] && unlink ~/.$linkname
  ln -sfv ~/.config/$rc_link ~/.$linkname
done; unset rc_links; unset rc_link; unset linkname

exec $(ps -p $$ -oargs= | tr -d '-') #returns name of the current shell
