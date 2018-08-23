#!/usr/bin/env bash

grep lncd /etc/passwd -q && exit 0
useradd -m -G audio,video,wheel,storage lncd

