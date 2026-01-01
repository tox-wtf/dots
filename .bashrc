# ~/.bashrc

[ -r /etc/profile ] && . /etc/profile

# Aliases
alias 0='sudo '
alias to='0 to'
alias s='0 s'
alias su='0 su'
alias v='$EDITOR'
alias ff='fastfetch'
alias jq='jq --indent 4'
alias ip='ip -c'
alias lsblk='lsblk -o NAME,PARTUUID,LABEL,TYPE,SIZE,MOUNTPOINTS'
alias ansistrip="sed 's,\x1b\[[0-9;]*m,,g'"
alias dots='git --git-dir=$HOME/.dots/ --work-tree=$HOME'

## git
alias gs='git status --short'
alias gl='git log --all --graph --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n"'
alias gc='git commit'
alias gco='git checkout'
alias gg='git push'
alias gp='git pull'
alias ga='git add'
alias gap='git add -p'
alias gd='git diff'

# Functions
frm() {
    pushd "${1:-.}" >/dev/null
    fzf -m | while IFS= read -r f; do
        rm -vf -- "$f"
    done
    popd >/dev/null
}

t() {
    session="${1:-def}"
    tmux attach -t "$session" || tmux new -s "$session"
}

manwtf() {
    local tmpfile=$(mktemp -u)
    curl -fsSL "man.tox.wtf/$1" -o $tmpfile
    man $tmpfile
}

mkcd() {
    mkdir -p "${1:?}" && cd "$1"
}

# Conditional environments
if command -v direnv &>/dev/null; then
    eval "$(direnv hook bash)"
fi

if command -v nvim &>/dev/null; then
    export EDITOR='nvim'
    export MANPAGER='nvim +Man!'
fi

if command -v eza &>/dev/null; then
    alias ls='eza --icons=always --color=always --group-directories-first -F=always --header --smart-group --mounts -o --git --no-quotes'
    alias l='ls -al'
    alias lt='ls -T'
fi

# Set up XDG variables
export XDG_MUSIC_DIR=$HOME/music
export XDG_PICTURES_DIR=$HOME/pics
export XDG_VIDEOS_DIR=$HOME/vids
export XDG_DOCUMENTS_DIR=$HOME/docs
export XDG_DOWNLOAD_DIR=$HOME/dls
export XDG_DESKTOP_DIR=/tmp/_desktop

# Misc variables
export TZ="America/Chicago"

# Prompt
NORMAL="\[\e[0m\]"
BOLD="\[\e[1m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"

if [ $EUID -eq 0 ]; then
    PS1="$BOLD$RED [ $NORMAL\w$BOLD$RED ] > $NORMAL"
else
    PS1="$BOLD$GREEN [ $NORMAL\w$BOLD$GREEN ] > $NORMAL"
fi

unset NORMAL BOLD RED GREEN
