# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set the theme to "agnoster" for a sleek, powerline-style prompt
ZSH_THEME="agnoster"

# Enable plugins (including our custom plugins for autosuggestions and syntax highlighting)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Source oh-my-zsh to apply settings
source $ZSH/oh-my-zsh.sh

# Optionally, add any other custom aliases or environment settings below
alias ll='ls -la'