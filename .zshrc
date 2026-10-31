
# uniquify PATH/FPATH (tied to path/fpath); prepending an existing entry moves it to the front
typeset -U path fpath

function reload() {
    source ~/.zshrc
}

# load brew installed completions
export FPATH
if type brew &>/dev/null; then
    # hardcoded instead of $(brew --prefix), which costs ~45ms per shell
    fpath=(${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh/site-functions $fpath)
    autoload -Uz compinit
    compinit -u
fi

# from: https://unix.stackexchange.com/questions/258656/how-can-i-delete-to-a-slash-or-a-word-in-zsh
backward-kill-dir () {
    WORDCHARS='' zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

NEWLINE=$'\n'
# 256 term color: https://jonasjacek.github.io/colors/
# PROMPT="${NEWLINE}%B%F{51}%~${NEWLINE}%F{green}➜ %F{red}%? %F{yellow}%D{%H:%M:%S} %F{13}[%j]> %b%F{grey}"
PROMPT="%(?.%F{yellow}.%F{red})%D{%H:%M:%S}> %b%F{grey}"

# clear any title a remote host set (e.g. curry@bastion) when we're back at a local prompt
reset_terminal_title() { print -n '\e]0;\a' }
autoload -Uz add-zsh-hook
add-zsh-hook precmd reset_terminal_title

[ -f ~/service ] && export SVDIR=~/service
[ -f ~/.ssh/ssh-agent-env ] && source ~/.ssh/ssh-agent-env

eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR=~/.nvm
# --no-use skips resolving the `lts/*` default alias (~350ms); put the newest installed node on PATH instead
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" --no-use  # This loads nvm
path=($NVM_DIR/versions/node/*/bin(nOn[1]N) $path)
#  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export LSCOLORS=Gxfxbxdxcxegedabagacad
alias ls='ls -G'
alias dcomp='docker-compose'
alias filesopen="lsof | awk '{print \$1 \"-\" \$2}' | sort | uniq -c | sort -nr | head -10"
alias gitprune="git branch --merged main | grep -v \"^[ *]*main$\" | xargs git branch -d"
alias gitprunable="git branch --merged main | grep -v \"^[ *]*main$\""

# native zsh instead of pathprepend, which forks env|sed (~14ms per call)
path=(~/.local/bin /usr/local/go/bin ~/go/bin ~/.cargo/bin $path)

# python environment
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
which pyenv > /dev/null && eval "$(pyenv init -)"

export PATH

# for emacs vterm library
[ -f ~/.emacs-vterm-zsh ] && source ~/.emacs-vterm-zsh

# make emacs the editor
export EDITOR="emacsclient -ar"

# local to this machine additions
if [ -f ~/.local.zsh ]; then source ~/.local.zsh; fi
