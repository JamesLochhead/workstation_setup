# Workstation configuration

This repository contains my personal configuration for a new workstation setup.
It is not intended to be used by anyone else, but feel free to use it if you
find it useful.

I am a former Linux desktop that switched to MacOS some years ago. I run a
GNU/Linux-like shell environment on MacOS.

This repository also contains my dotfiles, which are also intended to work on
Linux.

Dotfiles are managed with [GNU Stow](https://www.gnu.org/software/stow/), which
symlinks them from this repository (cloned on my local machine) to the home
directory.

## Installation instructions

Install Homebrew:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Manually activate Homebrew in the shell:

```
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Install software using Homebrew:

```
xargs brew install < brew_formulae_macos
xargs brew install < brew_casks
```

Clone this repository:

```
git clone git@github.com:JamesLochhead/workstation_setup.git "$HOME/Config"
```

`cd` into the repository and install dotfiles:

```
stow --adopt dotfiles
```

Set up Git:

```
bash git_setup.sh <EMAIL>
```

Make Bash the default shell:

```
# chsh -s "/opt/homebrew/bin/bash" "james"
```

## Neovim additions

Install Copilot:

```
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
```

Install LSP config:

```
git clone https://github.com/neovim/nvim-lspconfig \
~/.config/nvim/pack/nvim/start/nvim-lspconfig
```

## TextEdit

* Set to plain text and turn off spell check.

* Make clicking TextEdit icon in dock open a new document by default:

```
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false
```
