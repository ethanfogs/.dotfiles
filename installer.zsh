#!/bin/bash

mkdir -p ~/.{config,cache,local/{bin,share,state}}

[[ $PATH !~ ".*\.local/bin.*" ]] && path+=( $HOME/.local/{s,}bin )

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

if [ $(uname) = "Darwin" ]; then

    homebrew_install(){
        pkg_category=$*

        if [[ ! $$(command -v brew) ]]; then
            git clone https://github.com/Homebrew/brew ~/.local/homebrew;
            ln -sfv ~/.local/homebrew/bin/brew ~/.local/bin
        fi

        local cli_pkgs=(
            gnu-sed wget cmake
            go node yarn python rust sqlite 
            btop bat exa fd fzf ripgrep tldr tree
            neovim tmux bitwarden-cli
            zsh-{completion,autosuggestion}s
            {bash,brew-cask,pip,rustc,yarn}-completion
            gobuster httpie httpx john-jumbo nmap openvpn
            mplayer ffmpeg
        )

        if [[ $pkg_category =~ ".*cli.*" ]]; then
            brew install $cli_pkgs --force 2> /dev/null
        fi

        local desktop_pkgs=(
            bitwarden amethyst kitty protonvpn firefox brave-browser 
            wireshark burp-suite
        )

        if [[ $pkg_category =~ ".*desktop.*" ]]; then
            mkdir -p $HOME/Applications
            brew install $desktop_pkgs --cask \
                --force --no-quarantine --appdir=$HOME/Applications 1> /dev/null
        fi

        brew update > /dev/null && brew upgrade 2> /dev/null
    }

    homebrew_install cli desktop
fi

# curl -sk https://bun.sh/install | bash &> /dev/null \
# 	&& mv -f ~/.bun ~/.local/share/bun &> /dev/null;

# brew install -f 
# brew install -f 
# [ $$(uname -p) = "arm" ] || brew install -f docker{,-machine}
# brew upgrade
