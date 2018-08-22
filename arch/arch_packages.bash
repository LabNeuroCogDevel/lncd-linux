#!/usr/bin/env bash
set -xe

pacman -Sy git base-devel stow gfortran --noconfirm

utildir=/opt/utils/
[ ! -d  $utildir ] && mkdir -p $uitldir

cd $utildir
git clone https://aur.archlinux.org/package-query.git
git clone https://aur.archlinux.org/yaourt.git

(cd package-query && makepkg -si )
(cd yaourt &&  makepkg -si )

yaourt --noconfirm -S \
	terminology xterm \
	vim emacs rstudio-desktop-bin atom \
       	pcmanfm firefox \
	nodm xorg-xinit  xscreensaver\
	flameshot \
	libpng12 fsl \
	fasd the_silver_searcher rofi mlocate \
	slack-libpurple-git pidgin zim \
	openbox tint2 xbindkeys xcompmgr \
	zotero gnumeric \
	julia 

yaourt -S ttf-iosevka ttf-bitstream-vera ttf-freefont
# afni needs libpng12

# julia for atom
apm install uber-juno ide-r
#Rscript -e "install.packages(c('languageserver','atom-language-r'))"
