
# cool PATH funcs
. ~/.shell-funcs

function reload() {
    source ~/.zshrc
}

# from: https://unix.stackexchange.com/questions/258656/how-can-i-delete-to-a-slash-or-a-word-in-zsh
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
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

export GRAALVM_HOME="/Library/Java/JavaVirtualMachines/graalvm/Contents/Home/"
export JAVA_HOME=$(/usr/libexec/java_home)
export LSCOLORS=Gxfxbxdxcxegedabagacad
alias ls='ls -G'

pathprepend ~/.cargo/bin      PATH
pathprepend ~/go/bin          PATH
pathprepend /usr/local/go/bin PATH
pathprepend ~/.local/bin      PATH
pathprepend ~/bin             PATH

# uniquify PATH which is tied to path
typeset -U path

export PATH
