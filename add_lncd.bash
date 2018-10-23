#!/usr/bin/env bash

grep lncd /etc/passwd -q && exit 0
groupadd -r autologin # for pam + lightdm autologin
useradd -m -G audio,video,wheel,storage,autologin lncd

