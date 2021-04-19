
# cool PATH funcs
. ~/.shell-funcs

function reload() {
    source ~/.zshrc
}

# load brew installed completions
export FPATH
if type brew &>/dev/null; then
    pathprepend $(brew --prefix)/share/zsh/site-functions FPATH
    autoload -Uz compinit
    compinit
fi

# from: https://unix.stackexchange.com/questions/258656/how-can-i-delete-to-a-slash-or-a-word-in-zsh
backward-kill-dir () {
    WORDCHARS='' zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

NEWLINE=$'\n'
# 256 term color: https://jonasjacek.github.io/colors/
PROMPT="${NEWLINE}%B%F{51}%~${NEWLINE}%F{green}➜ %F{red}%? %F{yellow}%D{%H:%M:%S} %F{13}[%j]> %b%F{grey}"

[ -f ~/service ] && export SVDIR=~/service
[ -f ~/.ssh/ssh-agent-env ] && source ~/.ssh/ssh-agent-env

eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR=~/.nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && [ -z "$NVM_BIN" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

export CARP_DIR=~/Projects/Carp/

export LSCOLORS=Gxfxbxdxcxegedabagacad
alias ls='ls -G'
alias dcomp='docker-compose'
alias filesopen='lsof | awk '{print $1 "-" $2}' | sort | uniq -c | sort -nr | head -10'

pathprepend ~/.cargo/bin      PATH
pathprepend ~/go/bin          PATH
pathprepend /usr/local/go/bin PATH
pathprepend ~/.local/bin      PATH
pathprepend ~/bin             PATH

# multiple java environment management with jenv
[[ ! -v JENV_LOADED ]] && which jenv > /dev/null && eval "$(jenv init -)"

# uniquify PATH which is tied to path
typeset -U path

export PATH

# for emacs vterm library
[ -f ~/.emacs-vterm-zsh ] && source ~/.emacs-vterm-zsh
