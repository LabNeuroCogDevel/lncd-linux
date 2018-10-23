#!/usr/bin/env bash
set -xe

pacman -Sy git sudo base-devel stow gcc-fortran --noconfirm
# gcc-fortran for compiling R

if ! which yaourt >/dev/null; then
   utildir=/opt/utils/
   [ ! -d  $utildir ] && mkdir -p $uitldir

   cd $utildir
   git clone https://aur.archlinux.org/package-query.git
   git clone https://aur.archlinux.org/yaourt.git

   (cd package-query && makepkg -si )
   (cd yaourt &&  makepkg -si )
   cd -
fi

alias i='sudo -u lncd yaourt --noconfirm -S'

i \
	terminology xterm \
	vim emacs rstudio-desktop-bin atom \
   pcmanfm firefox \
	nodm xorg-xinit  xscreensaver\
	flameshot \
	libpng12 \
	fasd the_silver_searcher rofi mlocate \
	slack-libpurple-git pidgin zim \
	openbox tint2 xbindkeys xcompmgr nitrogen \
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
