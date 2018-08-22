#!/usr/bin/env bash

which afni >/dev/null && exit 0
[ ! -r afni_xorg.tgz ] && curl 'https://afni.nimh.nih.gov/pub/dist/tgz/linux_xorg7_64.tgz' > afni_xorg.tgz
[ ! -d /opt/ni_tools ] && mkdir -p /opt/ni_tools
tar -C /opt/ni_tools/ -xzvf afni_xorg.tgz 
mv /opt/ni_tools/linux_xorg7_64 /opt/ni_tools/afni
rm afni_xorg.tgz

# needed  packages
# pacman -S libpng12
