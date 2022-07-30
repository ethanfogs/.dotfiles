.SILENT:
base:
	mkdir -p ~/.{config,cache,local/{bin,share,state}}
	for dir in $(PWD)/*; do \
		[[ ! $$dir =~ ".*\.git.*" ]] && ln -sf $$dir ~/.config; \
	done;
	ln -sfv $(PWD)/shell/bash/bashrc.bash       ~/.bashrc;
	ln -sfv $(PWD)/shell/bash/bash_profile.bash ~/.bash_profile;
	ln -sfv $(PWD)/shell/zsh/zshrc.zsh          ~/.zshrc;
	ln -sfv $(PWD)/shell/zsh/zshenv.zsh         ~/.zshenv;

#------------------------------------------------------------------------------

.SILENT:
mac_cli:
	mkdir -p ~/.{config,cache,local/{bin,share,state}};
	[[ $$(command -v brew) ]] \
		|| git clone https://github.com/Homebrew/brew ~/.local/homebrew;
	brew install -f btop bat exa fd fzf ripgrep tldr tree 2> /dev/null;
	brew install -f gnu-sed wget cmake bitwarden-cli 2> /dev/null;
	brew install -f neovim tmux 2> /dev/null;
	brew install -f go node yarn python rust sqlite 2> /dev/null;
	curl -sk https://bun.sh/install | bash &> /dev/null \
		&& mv -f ~/.bun ~/.local/share/bun &> /dev/null;
	brew install -f zsh-{completion,autosuggestion}s {bash,brew-cask,pip,rustc,yarn}-completion 2> /dev/null;
	brew install -f gobuster httpie httpx john-jumbo nmap openvpn 2> /dev/null;
	[ $$(uname -p) = "arm" ] || brew install -f docker{,-machine}
	brew upgrade

.SILENT:
mac_desktop:
	mkdir -p ~/Applications;
	brew install bitwarden amethyst kitty protonvpn firefox brave-browser \
		wireshark burp-suite \
			--cask --force --appdir=~/Applications --no-quarantine 2> /dev/null;

#macos_defaults:
#       defaults write com.apple.Finder AppleShowAllFiles true
