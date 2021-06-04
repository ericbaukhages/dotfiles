# Use emacs bindings
bindkey -e

# Unset a few options
unsetopt autocd beep

# Settings for history file
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000000000000

# start the completion system
autoload -Uz compinit
compinit

# Prompt settings
# Find info on `vcs_info` in `man zshcontrib`
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}[%F{2}%b%F{5}]%f '
precmd () { vcs_info }
PS1='[%n@%m] %F{3}%3~ ${vcs_info_msg_0_}%f%# '

# Set EDITOR for `git`, etc.
export EDITOR="vim"
