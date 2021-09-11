# dotfiles

## Instructions

Install `oh-my-zsh`:

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Set up dotfiles bare repo:

```bash
git clone git@github.com:ericbaukhages/dotfiles.git --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

You can then use the `dotfiles` alias to track changes to `.dotfiles`.

## Warnings

To use the `git` settings, you'll need to create a `~/.gitconfig` referencing `.gitconfig.settings`:
```
[include]
	path = ~/.gitconfig.settings
```

## TODO

- [ ] use `--git-dir` and `--work-tree` options for signify in `nvim` when editing config files
- [ ] replicate the inline partial history search from oh-my-zsh

## Acknowledgement

Dotfiles structure inspired by [Marcel Krčah](https://marcel.is/managing-dotfiles-with-git-bare-repo/), [Mat Jones](https://github.com/mrjones2014/dotfiles), and [Flavio Antelo](https://antelo.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b).
