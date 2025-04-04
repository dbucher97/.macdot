export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Homebrew stuff

if [[ "$(arch)" == "i386" ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
else 
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

alias ib="PATH=$PATH:/usr/local/bin"


# export MATPLOTLIBRC=$HOME/.config/matplotlib
export EDITOR=nvim

# Aliases
# alias vim="nvim --startuptime /tmp/nvim-startuptime"
alias vim=nvim
alias python=python3
alias pip=pip3

alias ls="ls --color=auto"

alias pylab="ipython -i -c \"get_ipython().magic('load_ext autoreload'); get_ipython().magic('autoreload 2'); get_ipython().magic('pylab')\""

export PATH=$PATH:~/.cargo/bin/
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:/Library/TeX/texbin/


if [ -f ~/.gnuutils ]; then source ~/.gnuutils; fi
if [ -f ~/.pprofile ]; then source ~/.pprofile; fi
# if [ -f ~/.flutter_profile ]; then source ~/.flutter_profile; fi

alias prp="poetry run python"

alias ruff="poetry run ruff check --fix && poetry run ruff format"



topng() {
    local output_base="${1%.pdf}"
    if [ -z "$2" ]; then
        local dpi=300
    else
        local dpi="$2"
    fi

    magick -density $dpi $1 "${output_base}.png" 
}

