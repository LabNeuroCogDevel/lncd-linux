#
# ~/.bashrc
#

# 20180912 -- need LANG= to be defined
[ -z "$LANG" ] && export LANG=en_US.UTF-8

# want pacakges script files
for s in /etc/profile.d/*.sh; do
   [ -r $s ] && source $s
done

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# fasd: alias for z, f, v
eval "$(fasd --init auto)"

source $HOME/.aliases
source $HOME/.promptrc
source /opt/utils/fuzzy_arg/fuzzy_arg.bash
source /opt/utils/fuzzy_arg/fuzzy_new_complete.bash

export PATH="$PATH:/opt/ni_tools/afni"


