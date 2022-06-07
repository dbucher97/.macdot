# Make MacOS usable from scratch

A collection of dotfiles, scripts and programs to make MacOS usable for a
programmer.

A list of essential tools is given below:
- Homebrew
- ZSH (shell)
- Git
- Alacritty (terminal)
- Tmux (multiplexer)
- Neovim (editor)
- Karabiner
- skhd (Hotkeys)
- rectangle or yabai (window management)

## Defaults

Some defaults values are just shite:
```bash
# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0
```

## Package Manager

Although nix is coming up as an alternative declarative package manager, I so
far prefer [Homebrew](https://brew.sh/).

**Installation**

First of all, install the XCode Developer Tools

```bash
xcode-select --install
```

Then, you can go ahead and install homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Thats it, now the `brew` command is available to you.

### Essentail programs
```bash
brew install python htop neovim vim node gcc clang cmake git tmux jq
```

## GNU programs

Most of the basic BSD command line utility programs are very much related to the
GNU utilities (or much more the other way round). However, the GNU utilities
seem to have evolved more and are a bit more verstile comapred to the BSD
counterparts. Coming from a linux background, the GNU tools are also much more
familiar with my workflow. To install them, simply

```bash
brew install coreutils util-linux gnu-sed grep make
```

Finally, make sure, your `.profile` sources `.gnuutils`, which loads the utils'
binary paths into your runtime path. _Ignore this step_ if you are using the
`.profile` from this repo.

## ZSH

A usable shell `zsh`, the brew version

```bash
brew install zsh fzf
```

Add shell to standard shells list and change the shell
```bash
echo "/opt/homebrew/bin/zsh" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/zsh
```

Install the `zshrc` and `profile`
```bash
make zsh
make profile
```

Install antigen
```bash
curl -L git.io/antigen > antigen.zsh
```

## Git

Install git config
```
make git
```

## Alacritty

## Tmux

## Neovim

## Karabiner

## skhd

## Rectangle

## Yabai

I recently tried [yabai](https://github.com/koekeishiya/yabai) as a window
management tool. So far, I am not sure if I want to keep it, but I have found
some favour in the idea of going back to a tiling window manager: The
keyboard-centric movement is an absolute joy. Also, so much time is spared by
skipping animations and going from one window or space to another instantly.

### spacebar
