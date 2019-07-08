#!/usr/bin/env bash

#
# 20190702 - install packagse from aur
# require not root user
# 
utildir="/opt/utils/"
if [ $USER == "root" ]; then
	[ ! -d $utildir ] && mkdir -p $utildir
	chown lncd: -R $utildir
	su lncd $0
	exit
fi
set -xe

if ! which yaourt >/dev/null; then
   [ ! -d $utildir ] && mkdir -p $utildir

   cd $utildir
   [ ! -d package-query ] && git clone https://aur.archlinux.org/package-query.git
   [ ! -d yaourt ] && git clone https://aur.archlinux.org/yaourt.git

   (cd package-query && makepkg -si )
   (cd yaourt &&  makepkg -si )
   cd -
fi

i(){ yaourt --noconfirm -S $@; }

i \
	terminology xterm \
	gvim emacs rstudio-desktop-bin atom \
   pcmanfm firefox \
	xorg-xinit  xscreensaver lightdm lightdm-gtk-greeter accountsservice\
	flameshot \
	libpng12 \
	fasd the_silver_searcher rofi mlocate \
	slack-libpurple-git pidgin zim \
	openbox tint2 xbindkeys xcompmgr nitrogen lxpanel gtk-chtheme \
	zotero gnumeric \
	julia conky \
   exa bat diff-so-fancy

i ttf-iosevka ttf-bitstream-vera ttf-freefont
# afni needs libpng12

# julia for atom
apm install uber-juno ide-r
#Rscript -e "install.packages(c('languageserver','atom-language-r'))"

# this breaks without vtk6 modification
i fsl

#(cd $(dirname $0)/arch/root-tail/ && makepkg -si)
