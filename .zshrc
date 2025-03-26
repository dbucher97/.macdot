#! /usr/bin/env zsh

# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# if [ ! -e ~/.local/share/zsh/antigen.zsh ]; then
#   mkdir -p ~/.local/share/zsh
#   curl -L git.io/antigen > ~/.local/share/zsh/antigen.zsh
# fi

source ~/.local/share/zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle ael-code/zsh-colored-man-pages
antigen bundle esc/conda-zsh-completion

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


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/david/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/david/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/david/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/david/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

[[ ! -r /Users/david/.opam/opam-init/init.zsh ]] || source /Users/david/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export LUNA_ENCRYPTION_KEY="kVlHY6Ru5Y-oMGOqg-x6yt_6fqp1kQ0URmktMMKA38I="

source "$HOME/.cargo/env"
