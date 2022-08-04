mkdir -p ~/.{config,cache,local/{bin,share,state,env}}
chmod 700 ~/.local/env 2> /dev/null || rm -rf ~/.local/env

for dir in $(ls); do
  ln -sv $(pwd)/$dir ~/.config/$(basename $dir);
done

links=(
  shell/bash/bashrc.bash       
  shell/bash/bash_profile.bash 
  shell/zsh/zshenv.zsh         
  shell/zsh/zshrc.zsh          
  vim                          
)

for link in $links; do
  ln -sv ~/.config/$link ~/.$(basename $link | sed 's/\..*//g')
done

exec $SHELL

# vim: filetype=sh
