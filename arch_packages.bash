#!/usr/bin/env bash
set -xe

pacman -Sy git base-devel stow nodm mlocate gfortran --noconfirm

utildir=/opt/utils/
[ ! -d  $utildir ] && mkdir -p $uitldir

cd $utildir
git clone https://aur.archlinux.org/package-query.git
git clone https://aur.archlinux.org/yaourt.git

(cd package-query && makepkg -si )
(cd yaourt &&  makepkg -si )

yaourt --noconfirm -S terminology emacs rstudio-desktop-bin pcmanfm firefox \
	fasd flameshot xorg-xinit \
	libpng12 fsl \
	the_silver_searcher \
	slack-libpurple-git pidgin zim \
	openbox tint2 xbindkeys xcompmgr \
	zotero

# afni needs libpng12
