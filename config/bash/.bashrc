#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# fasd: alias for z, f, v
eval "$(fasd --init auto)"

alias l=ls
alias s=ssh # override fasd's s
alias g="egrep --color=yes" # override fasd's s
alias p="perl -lne"

source $HOME/.promptrc
source /opt/utils/fuzzy_arg/fuzzy_arg.bash

export PATH="$PATH:/opt/ni_tools/afni"

