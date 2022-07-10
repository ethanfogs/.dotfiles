# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/oh-my-zsh"

ZSH_THEME="agnoster"
#ZSH_THEME="cloud"
#ZSH_THEME="darkblood"
#ZSH_THEME="edvardm"
#ZSH_THEME="fox"
#ZSH_THEME="jonathan"
#ZSH_THEME="trapd00r"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
