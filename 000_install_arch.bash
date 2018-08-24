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
arch/arch_packages.bash
echo "## lncd"
./add_lncd.bash
echo "lncd ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/lncd
echo "## fstab and passwords"
./add_fstab.bash
echo "## local tools"
./localtools.bash
echo "## afni"
./afni.bash

echo "## nodm"
cp etc/nodm.conf /etc/nodm.conf

sudo -u lncd ./config_this_user.bash
