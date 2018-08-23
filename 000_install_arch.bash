#!/usr/bin/env bash

arch/arch_packages.bash
echo "lncd"
./add_lncd.bash
echo "fstab and passwords"
./add_fstab.bash
echo "local tools"
./localtools.bash
echo "afni"
./afni.bash

echo "nodm"
cp etc/nodm.conf /etc/nodm.conf
