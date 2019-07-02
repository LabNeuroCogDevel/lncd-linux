#!/usr/bin/env bash
set -xe

pacman -Sy git sudo base-devel stow gcc-fortran --noconfirm
# gcc-fortran for compiling R
