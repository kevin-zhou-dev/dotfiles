# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# history
HISTSIZE=10000
SAVEHIST=10000
# HISTFILE=~/.cache/zsh/history

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
plugins=(git z)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# source config files
[ -f ~/dotfiles_local/.alias_local ] && source ~/dotfiles_local/.alias_local
[ -f ~/.alias ] && source ~/.alias

# oh-my-zsh
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
# command-line fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fish like syntax highlight
[ -f ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] &&  source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
