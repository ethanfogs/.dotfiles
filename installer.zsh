#!/bin/bash

mkdir -p ~/.{config,cache,local/{bin,share,state}}

[[ ! $PATH =~ ".*\.local/bin.*" ]] && path+=( $HOME/.local/{s,}bin )

for dir in $PWD/*; do
    [[ ! $dir =~ ".*\.git.*" ]] && ln -sfv $dir $HOME/.config/$(basename $dir);
done

links=(
    $HOME/.config/shell/bash/bashrc.bash       
    $HOME/.config/shell/bash/bash_profile.bash 
    $HOME/.config/shell/zsh/zshrc.zsh          
    $HOME/.config/shell/zsh/zshenv.zsh         
    $HOME/.config/vim                          
)

for link in ${links[@]}; do
    ln_name=$(basename $link | sed 's/\..*//g')
    [ -h $HOME/.$ln_name ] && unlink $HOME/.$ln_name
    ln -sfv $link $HOME/.$ln_name
    [ -h $HOME/.$ln_name/$ln_name ] && unlink $HOME/.$ln_name/$ln_name
done
