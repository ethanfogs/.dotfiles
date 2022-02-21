# - MAKEFILE FOR *GLOBAL* USER CONFIG ( @ ~/.config )
#
# -----------------------------------------------------------------------------

MKDIR = mkdir -vp
LN = ln -svf

# -----------------------------------------------------------------------------

XDG_CONFIG_HOME  = $(HOME)/.config
XDG_DATA_HOME    = $(HOME)/.local/share
XDG_STATE_HOME   = $(HOME)/.local/state
XDG_CACHE_HOME   = $(HOME)/.cache

XDG_BASE_DIRS   := $(XDG_CONFIG_HOME) $(XDG_DATA_HOME) \
				   $(XDG_STATE_HOME) $(XDG_CACHE_HOME)

COMMON_UNIX_DIRS = $(HOME)/.bin

# -----------------------------------------------------------------------------

SHELL_RC_FILES := profile sharedrc bashrc inputrc aliasrc

# -----------------------------------------------------------------------------

init:
	$(MKDIR) $(XDG_BASE_DIRS) $(COMMON_UNIX_DIRS)
	[ ! $(PWD) = $(XDG_CONFIG_HOME) ] || cd $(XDG_CONFIG_HOME)

# -----------------------------------------------------------------------------

github:
	ssh-keygen -t ed25519 -C "fogartyethan@gmail.com"
