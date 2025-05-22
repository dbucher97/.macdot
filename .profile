export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Homebrew stuff
if [[ "$(uname)" == "Darwin" ]]; then
    if [[ "$(arch)" == "i386" ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    else 
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
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
    local range=""
    if [ -n "$3" ]; then
        range="[$3]"
    fi
    if [ -z "$2" ]; then
        local dpi=300
    else
        local dpi="$2"
    fi

    magick -density $dpi "$1$range" -alpha remove "${output_base}.png" 
}

totransparentpng() {
    local output_base="${1%.pdf}"
    local range=""
    if [ -n "$3" ]; then
        range="[$3]"
    fi
    if [ -z "$2" ]; then
        local dpi=300
    else
        local dpi="$2"
    fi

    magick -density $dpi "$1$range" "${output_base}.png" 
}


devattach () {
    local devcontainer="$(basename $PWD)"
    local output_array=()
    while IFS= read -r line; do
        output_array+=("$line")
    done < <(docker ps --format "{{.Image}} {{.Names}}" | grep "$devcontainer")
    local array_length=${#output_array[@]}

    if [ "$array_length" -eq 0 ]; then
        echo "Error: No running container found!" >&2
        return 1
    elif [ "$array_length" -gt 2 ]; then
        echo "Error: Too many containers found!" >&2
        return 1
    fi

    local first_line="${output_array[1]}"
    local val=$(echo "$first_line" | awk '{print $2}')

    docker exec -it "$val" sh -c "cd /workspaces/$devcontainer/ && zsh"
}
