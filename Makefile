PKGS_BASE = wget

PKGS_TERMINALS = kitty alacritty
PKGS_CLI_TOOLS = tmux neovim jq fd ripgrep bat exa most fzf tree tldr 
PKGS_PROGLANGS = python3 node rust lua golang

PKGS_DESKTOP = firefox brave-browser bitwarden protonvpn
PKGS_MAC_DESKTOP = amethyst
PKGS_FONTS = font-hack-nerd-font

PKGS_ADMIN = ansible nmap wireshark masscan
PKGS_SEC = burp-suite snort metasploit john-jumbo hydra ghidra aircrack-ng

PKGS_ALL = $(PKGS_DEV) $(PKGS_TERMINALS) $(PKGS_CLI_TOOLS) $(PKGS_DEV) $(PKGS_DESKTOP) $(PKGS_MAC_DESKTOP) $(PKGS_FONTS) $(PKGS_ADMIN) $(PKGS_SEC)

HOMEBREW_URL = https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
INSTALL_HOMEBREW = curl -fsSL $(HOMEBREW_URL) | /bin/bash

MAC_INIT = sudo softwareupdate --install && sudo xcode-select --install

init:
	mkdir -p ~/.{cache,config,local/{share,state,bin,env}}
	git clone https://github.com/ethanfogs/dotfiles .dotfiles

macos_defaults:
	defaults write com.apple.Finder AppleShowAllFiles true
