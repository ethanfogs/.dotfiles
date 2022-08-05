mkdir -p ~/.{config,cache,local/{bin,share,state,env}}
chmod 700 ~/.local/env || rm -rf ~/.local/env

for dir in $(ls); do
  [ -h ~/.config/$dir ] && unlink ~/.config/$dir
  ln -sv $(pwd)/$dir ~/.config/$(basename $dir);
done

links=(
  shell/profile.sh
  shell/bash/bashrc.bash       
  shell/bash/bash_profile.bash 
  shell/zsh/zprofile.zsh         
  shell/zsh/zshrc.zsh          
  vim                          
)

for link in $links; do
  linkname=$(basename $link | sed 's/\..*//g')
  [ -h ~/.$linkname ] && unlink ~/.$linkname
  ln -sv ~/.config/$link ~/.$linkname
done

exec $SHELL

# vim: filetype=sh