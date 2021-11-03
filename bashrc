# ~/.bashrc: executed by bash(1) for non-login shells.

alias ll='ls -al'
export LC_CTYPE="en_US.UTF-8"
alias grep='grep --color'

# added fellow udacity git&github
source ~/git-completion.bash
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"
# end added fellow udacity git&github
