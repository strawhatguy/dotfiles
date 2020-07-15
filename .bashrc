
. ~/.shell-funcs

function reload() {
    source ~/.bash_profile
}

RED="\[\e[0;31m\]"
BOLDRED="\[\e[1;31m\]"
CYAN="\[\e[0;36m\]"
BOLDCYAN="\[\e[1;36m\]"
GREEN="\[\e[0;32m\]"
BOLDGREEN="\[\e[1;32m\]"
PURPLE="\[\e[0;35m\]"
BOLDPURPLE="\[\e[1;35m\]"
BROWN="\[\e[0;33m\]"
BOLDBROWN="\[\e[1;33m\]"
NOCOLOR="\[\e[m\]"

PS1="\n$BOLDCYAN\w$NOCOLOR\n${BOLDGREEN}➜ $BOLDRED\$? $BOLDBROWN\t $BOLDPURPLE[\j]>$NOCOLOR "

eval "$(direnv hook bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR=~/.nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && [ -z "$NVM_BIN" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

export CARP_DIR=$HOME/Projects/Carp/
export GRAALVM_HOME="/Library/Java/JavaVirtualMachines/graalvm/Contents/Home/"
export JAVA_HOME=$(/usr/libexec/java_home)
export LSCOLORS=Gxfxbxdxcxegedabagacad
alias ls='ls -G'

pathprepend ~/.cargo/bin      PATH
pathprepend ~/go/bin          PATH
pathprepend /usr/local/go/bin PATH
pathprepend ~/.local/bin      PATH
pathprepend ~/bin             PATH

export PATH
