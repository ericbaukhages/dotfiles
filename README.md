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

You also have to have bash 5.3+ installed and available on the path, or some of the tmux plugins will break. Note that you'll have to do this on macos:

```bash
brew install bash
sudo ln -s /opt/homebrew/bin/bash /usr/local/bin/bash
```

## TODO

- [ ] use `--git-dir` and `--work-tree` options for signify in `nvim` when editing config files
- [ ] replicate the inline partial history search from oh-my-zsh

## Acknowledgement

Dotfiles structure inspired by [Marcel Krčah](https://marcel.is/managing-dotfiles-with-git-bare-repo/), [Mat Jones](https://github.com/mrjones2014/dotfiles), and [Flavio Antelo](https://antelo.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b).

Inspiration for neovim lua config found [here](https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/), thanks Heiker Curiel.
