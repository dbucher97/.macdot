#! /usr/bin/env zsh

if [ ! -e ~/.local/share/zsh/antigen.zsh ]; then
  mkdir -p ~/.local/share/zsh
  curl -L git.io/antigen > ~/.local/share/zsh/antigen.zsh
fi

source ~/.local/share/zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle ael-code/zsh-colored-man-pages

antigen theme wezm

antigen apply

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load profile
source ~/.profile
