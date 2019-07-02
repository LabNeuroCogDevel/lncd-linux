#!/usr/bin/env bash

#
# as root (after reading all this code does to make sure it wont fry your new system)
# curl https://raw.githubusercontent.com/LabNeuroCogDevel/lncd-linux/master/000_install_arch.bash | bash

# get this script and friends
rootinstall=/opt/utils/lncd-linux 
[ ! -d $(dirname $rootinstall) ] && mkdir -p $(dirname $rootinstall)
[ ! -d "$rootinstall" ] && git clone https://github.com/LabNeuroCogDevel/lncd-linux.git $rootinstall

cd $rootinstall

echo "## arch packages lncd"
arch/01_arch_packages.bash
echo "## lncd"
./add_lncd.bash
echo "lncd ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/lncd
echo "## AUR packages"
arch/02_arch_yaourt_pkgs.bash
echo "## fstab and passwords"
./add_fstab.bash
echo "## local tools"
./localtools.bash
echo "## afni"
./afni.bash

echo "## login manager (lightdm)"
#cp etc/nodm.conf /etc/nodm.conf
cp etc/lightdm.conf /etc/lightdm/lightdm.conf

sudo -u lncd ./config_this_user.bash
