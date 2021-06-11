# dotfiles

## Instructions

Set up dotfiles bare repo:

```bash
git clone git@github.com:ericbaukhages/dotfiles.git --bare $HOME/projects/dotfiles.git
git --git-dir=$HOME/projects/dotfiles.git --work-tree=$HOME status.showUntrackedFiles no
```

Then to access the dotfiles git repo use the following command:

```bash
git --git-dir=$HOME/projects/dotfiles.git --work-tree=$HOME
```

`.zshrc` provides an alias `cfg` for this command.

For now, you'll need to create a `~/.gitconfig` referencing `.gitconfig.settings`:

```
[include]
	path = ~/.gitconfig.settings
```

## TODO

- [ ] copy `git` completion for `cfg`
- [ ] use `--git-dir` and `--work-tree` options for signify in `nvim`
- [ ] replicate the inline partial history search from oh-my-zsh

## Acknowledgement

Dotfiles structure inspired by [Marcel Krčah](https://marcel.is/managing-dotfiles-with-git-bare-repo/) and [Mat Jones](https://github.com/mrjones2014/dotfiles).
