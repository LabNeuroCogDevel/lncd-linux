#!/usr/bin/env bash


# stop if root
[ $(id -u) -lt 10 ] && echo "ERROR: $0: run as lncd not $(whoami)!" >&2 && exit 1

# stop if no stow 
! command -v stow >/dev/null && echo "need stow installed" && exit 1

# get all of version control scripts into user home (mostly for config)
[ ! -d $HOME/src/ ] && mkdir $HOME/src
[ ! -e $HOME/src/lncd-linux ] && \
  git clone https://github.com/LabNeuroCogDevel/lncd-linux.git $HOME/src/lncd-linux

# how to install (symlink) config files
stowit(){ 
	[ ! -d $1 ] && mkdir -p $1
	stow -d ~/src/lncd-linux/config -t $1 $2
}

# generic dot files
for prog in emacs bash x11 xbindkeys vim; do
	stowit ~ $prog
done

# ~/.config/ config files
for prog in tint2 openbox nitrogen conky; do
 stowit ~/.config/$prog $prog
done

# with specific config directories
stowit ~/.ssh ssh

# ## EDITORS
# vim config
if [ ! -r ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qall
fi
# TODO: emacs
# emacs --eval "(package-install 'use-package)"
