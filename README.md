# dotfiles

## Instructions

Set up dotfiles bare repo:

```bash
git clone git@github.com:ericbaukhages/dotfiles.git --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
```
## TODO

- [ ] use `--git-dir` and `--work-tree` options for signify in `nvim` when editing config files
- [ ] replicate the inline partial history search from oh-my-zsh

## Acknowledgement

Dotfiles structure inspired by [Marcel Krčah](https://marcel.is/managing-dotfiles-with-git-bare-repo/) and [Mat Jones](https://github.com/mrjones2014/dotfiles).
