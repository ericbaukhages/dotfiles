# $PATH {{{
export GOPATH=$HOME/go
export RUSTPATH=$HOME/.cargo
export PATH=$PATH:$GOPATH/bin:$RUSTPATH/bin
#}}}

# oh-my-zsh {{{
export ZSH_DISABLE_COMPFIX
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
	fzf
	gitfast
	macos
	z
)

source $ZSH/oh-my-zsh.sh
# }}}

# settings {{{
export GIT_PS1_SHOWUPSTREAM="auto"
export PAGER="less --mouse"
export SCRATCH_DIR="$HOME/Documents/scratch"
export HOMEBREW_BUNDLE_FILE="$HOME/.Brewfile"
# }}}

# aliases {{{
alias less="less --mouse"
alias tree="tree --dirsfirst -I 'node_modules|dist|vendor'"
alias a="tmux attach"
alias bat="bat -pp"

alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# Use $ZSH/custom for additional aliases
# }}}

# vim {{{
# Config and shell function to toggle between traditional vim config, and lua config
export NVIM_LSP_CONFIG_FILE="$HOME/.config/nvim/init.lua"
export NVIM_CONFIG_FILE="$HOME/.config/nvim/init.vim"

alias vim="nvim -u $NVIM_CONFIG_FILE"
export EDITOR="nvim -u $NVIM_CONFIG_FILE"

vimswitch() {
  local CURRENT_VIM_CONFIG_FILE=`which vim | sed 's/^vim: aliased to nvim -u //'`
  if [[ "$CURRENT_VIM_CONFIG_FILE" != "$NVIM_CONFIG_FILE" ]]; then
    echo "Switching to normal vim: 'vim -u $NVIM_CONFIG_FILE'"
    alias vim="nvim -u $NVIM_CONFIG_FILE"
    export EDITOR="nvim -u $NVIM_CONFIG_FILE"
  else
    echo "Switching to alternative vim: 'nvim -u $NVIM_LSP_CONFIG_FILE'"
    alias vim="nvim -u $NVIM_LSP_CONFIG_FILE"
    export EDITOR="nvim -u $NVIM_LSP_CONFIG_FILE"
  fi
}
# }}}

# shell functions {{{
j () {
  cd "$(z | fzf | awk '{print $2}')"
}

g () {
  git checkout $(git branch -a --format="%(refname:short)" --sort="-authordate" | fzf | sed 's|origin/||g')
}

scratch() {
  vim +'normal G' $SCRATCH_DIR/`date +'%Y-%m-%d'`.md
}

scratchlast() {
	vim $SCRATCH_DIR/`ls -t $SCRATCH_DIR | head -n 1`
}

getextension() {
  # with help from: https://stackoverflow.com/a/965072

  filename="$1"
  extension="${filename##*.}"

  echo $extension
}

vimbranchdiff() {
  FILE="$1"
  REF="$2"

  vim -d $FILE <(git show $REF:$FILE)
}

vimgitshow() {
  FILE="$1"
  REF="$2"
  vim <(git show $REF:$FILE)
}
# }}}

# vim: fdm=marker
