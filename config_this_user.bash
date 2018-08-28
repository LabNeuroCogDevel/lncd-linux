#!/usr/bin/env bash

[ ! -d $HOME/src/ ] && mkdir $HOME/src
[ ! -e $HOME/src/lncd-linux ] && \
  git clone https://github.com/LabNeuroCogDevel/lncd-linux.git $HOME/src/lncd-linux

stowit(){ 
	[ ! -d $1 ] && mkdir -p $1
	stow -d ~/src/lncd-linux/config -t $1 $2
}

# generic dot files
for prog in emacs bash x11 xbindkeys; do
	stowit ~ $prog
done

# with specific config directories
stowit ~/.ssh            ssh
stowit ~/.config/tint2   tint2
stowit ~/.config/openbox openbox