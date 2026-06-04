# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## Install

On a new machine, run:

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply ericbaukhages
```

This will:

- Install chezmoi
- Clone this repo into `~/.local/share/chezmoi`
- Prompt for your Git name and email
- Install oh-my-zsh (if missing)
- Apply all dotfiles
- Run OS-specific setup scripts (Homebrew bundle on macOS, folder creation, etc.)

After installation, use the `dotfiles` alias (or `chezmoi` directly) to manage your dotfiles.

## Daily use

```bash
# See what would change
chezmoi diff

# Edit a dotfile's source
chezmoi edit ~/.zshrc

# Apply changes
chezmoi apply

# Pull latest changes from GitHub and apply
chezmoi update
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

## TODO

- [ ] use chezmoi to manage signify in `nvim` when editing config files
- [ ] replicate the inline partial history search from oh-my-zsh

## Acknowledgement

Dotfiles managed with [chezmoi](https://www.chezmoi.io/).

Previous dotfiles structure inspired by [Marcel Krčah](https://marcel.is/managing-dotfiles-with-git-bare-repo/), [Mat Jones](https://github.com/mrjones2014/dotfiles), and [Flavio Antelo](https://antelo.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b).

Current `nvim` config started by copying the Neovim From Scratch by MrJakob (Jakob Westhoff) ([Youtube](https://www.youtube.com/watch?v=g1gyYttzxcI) [GitHub](https://github.com/jakobwesthoff/nvim-from-scratch)).
