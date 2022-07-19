XDG_BIN_HOME    ?= $(HOME)/.local/bin
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_CACHE_HOME  ?= $(HOME)/.cache
XDG_DATA_HOME   ?= $(HOME)/.local/share
XDG_STATE_HOME  ?= $(HOME)/.local/state

BASE_DIRS = \
	$(XDG_BIN_HOME) $(XDG_CONFIG_HOME) $(XDG_STATE_HOME)
	$(XDG_CACHE_HOME) $(XDG_DATA_HOME)

#------------------------------------------------------------------------------

GH            = https://github.com
CLONE         = git clone $(GH)
DOTFILES_GH   = ethanfogs/dotfiles

#------------------------------------------------------------------------------

#.SILENT:
#.ONESHELL:
config:
	mkdir -p $(BASE_DIRS)
	$(CLONE)/$(DOTFILES_GH) $(XDG_CACHE_HOME)/dotfiles
	cp -iR  $(XDG_CACHE_HOME)/dotfiles/* $(XDG_CONFIG_HOME)/
	ln -svf $(XDG_CONFIG_HOME)/shell/profile.sh             $(HOME)/.profile
	ln -svf $(XDG_CONFIG_HOME)/shell/zsh/zprofile.zsh       $(HOME)/.zprofile
	ln -svf $(XDG_CONFIG_HOME)/shell/zsh/zshrc.zsh          $(HOME)/.zshrc
	ln -svf $(XDG_CONFIG_HOME)/shell/bash/bash_profile.bash $(HOME)/.bash_profile
	ln -svf $(XDG_CONFIG_HOME)/shell/bash/bashrc.bash       $(HOME)/.bashrc

#------------------------------------------------------------------------------

homebrew:
	mkdir -p $(BASE_DIRS)
	[ `command -v brew` ] || $(CLONE)/Homebrew/brew $(XDG_DATA_HOME)/homebrew
	ln -sfv $(XDG_DATA_HOME)/homebrew/bin/brew $(XDG_BIN_HOME)/

#------------------------------------------------------------------------------

CLI_PKGS  = neovim tmux fd ripgrep bat exa jq tree tldr fzf
DEV_PKGS  = python3 node lua rust golang
FONT_PGKS = font-hack-nerd-font

ifeq ($(shell uname -s),Darwin)
        INSTALL := brew install
else
        INSTALL := sudo apt-get install
endif

cli:
	$(INSTALL) $(CLI_PKGS)

dev:
	$(INSTALL) $(DEV)

#------------------------------------------------------------------------------

DESKTOP_PKGS     = kitty firefox bitwarden protonvpn logi-options-plus
MAC_DESKTOP_PKGS = $(DESKTOP_PKGS) amethyst

desktop:
	$(INSTALL) $(DESKTOP_PKGS)

mac_desktop:
	$(INSTALL) $(MAC_DESKTOP_PKGS)

#------------------------------------------------------------------------------

clean:
	rm -rf $(XDG_CACHE_HOME)/dotfiles

#macos_defaults:
#       defaults write com.apple.Finder AppleShowAllFiles true
