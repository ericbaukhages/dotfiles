# dotfiles

## Instructions

Install `oh-my-zsh`:

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Set up dotfiles repo, using `stow`:

```bash
git clone git@github.com:ericbaukhages/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```

## Iosevka

To install the iosevka fonts on Ubuntu:

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -s 'https://api.github.com/repos/be5invis/Iosevka/releases/latest' | jq -r ".assets[] | .browser_download_url" | grep PkgTTF-IosevkaTerm- | xargs -n 1 curl -L -O --fail --show-error
curl -s 'https://api.github.com/repos/be5invis/Iosevka/releases/latest' | jq -r ".assets[] | .browser_download_url" | grep PkgTTF-Iosevka- | xargs -n 1 curl -L -O --fail --show-error
```
Don't forget to unzip the downloads.

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

Previous dotfiles structure inspired by [Marcel Krčah](https://marcel.is/managing-dotfiles-with-git-bare-repo/), [Mat Jones](https://github.com/mrjones2014/dotfiles), and [Flavio Antelo](https://antelo.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b).

Inspiration for neovim lua config found [here](https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/), thanks Heiker Curiel.
