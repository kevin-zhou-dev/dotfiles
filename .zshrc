# shellcheck disable=SC2148
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# history
HISTSIZE=10000
SAVEHIST=10000
# HISTFILE="$HOME"/.cache/zsh/history

# vi mode
bindkey -v
export KEYTIMEOUT=1

# See other themes https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Activate syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# Plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git z zsh-autosuggestions jump)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# oh-my-zsh
[ -f "$ZSH"/oh-my-zsh.sh ] && source "$ZSH"/oh-my-zsh.sh
# command-line fuzzy finder
[ -f "$HOME"/.fzf.zsh ] && source "$HOME"/.fzf.zsh
# fish like syntax highlight
[ -f "$HOME"/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] &&  source "$HOME"/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source config files
[ -f "$HOME"/.alias ] && source "$HOME"/.alias
[ -f "$HOME"/dotfiles_local/.alias_local ] && source "$HOME"/dotfiles_local/.alias_local

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion