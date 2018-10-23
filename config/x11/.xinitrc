#!/usr/bin/env bash
xrdb ~/.Xdefaults # default term colors, alt key in xterm
xcompmgr &
tint2 & #plank &
xrandr --output DVI-I-1 --left-of VGA-1
nitrogen --restore 
xbindkeys 
#xscreensaver -no-splash &
(sleep 10; conky) &
gvolwheel -d hw:0 &
(sleep 3; flameshot) &
# see also /etc/X11/xinit/xinitrc.d/30-dbus.sh
# https://wiki.archlinux.org/index.php/init#Dbus
openbox-session
