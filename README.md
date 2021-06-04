# dotfiles

## Instructions

Initialize `git` inside of `$HOME`. Also, set `showUntrackedFiles` to `no`.

```bash
cd ~
git init
git config status.showUntrackedFiles no
```

Then add the dotfiles repo as the remote `origin`:

```bash
git remote add origin git@github.com:ericbaukhages/dotfiles.git
```

Then you should be able to pull down the remote:

```bash
git pull --set-upstream origin main
```

The setup is more complicated than using a bare repo, but it's worth it for two reasons:

1. It allows you to use `git` instead of some alias. This allows you to use the prompt completion options, which wouldn't be available for the alias.
2. This allows `vim` (or some other editor) to show git diff/history without having to set strange options.

## Acknowledgement

Dotfiles structure inspired by [Marcel Krčah](https://marcel.is/managing-dotfiles-with-git-bare-repo/) and [Mat Jones](https://github.com/mrjones2014/dotfiles).
