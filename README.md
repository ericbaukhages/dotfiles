# dotfiles

## Instructions

First, clone the dotfiles repo locally.

```bash
git clone https://github.com/ericbaukhages/dotfiles.git --bare $HOME/.dotfiles
```

Then to access the dotfiles, you need to use the following options on `git`:

```bash
git --git-dir=$HOME/.dotfiles --work-tree=$HOME
```

Conveniently, there is an alias in `~/.zshrc`, `config`, which pre-populates these options.

## Acknowledgement

Dotfiles structure inspired by [Marcel Krčah](https://marcel.is/managing-dotfiles-with-git-bare-repo/) and [Mat Jones](https://github.com/mrjones2014/dotfiles).
