# ============================= zsh settings =============================

# Use emacs bindings
bindkey -e

# Unset a few options
unsetopt autocd beep

# Settings for history file
setopt inc_append_history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000000000000

# start the completion system
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# Prompt settings
# Find info on `vcs_info` in `man zshcontrib`
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}[%F{2}%b%F{5}]%f '
precmd () {
	vcs_info

	if [[ -z ${vcs_info_msg_0_} ]]; then
		PS1="%n@%m %F{3}%5~ %f%# "
	else
		PS1="%n@%m %F{3}%3~ ${vcs_info_msg_0_}%f%# "
	fi
}

# Plugins
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source $HOME/.config/zsh/zsh-z.plugin.zsh

# ============================= user settings =============================

# Set EDITOR for `git`, etc.
export EDITOR="vim"

# Aliases
alias tree="tree --dirsfirst"
alias ls="ls --color --group-directories-first"

# Functions

j () {
	cd $(z | grep -v common: | fzf | awk '{print $2}')
}
