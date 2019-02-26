#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# fasd: alias for z, f, v
eval "$(fasd --init auto)"
alias s=ssh

source $HOME/.aliases
source $HOME/.promptrc
source /opt/utils/fuzzy_arg/fuzzy_arg.bash

export PATH="$PATH:/opt/ni_tools/afni"

