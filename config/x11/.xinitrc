#!/usr/bin/env sh
xrandr --output DVI-I-1 --left-of VGA-1
xbindkeys 
nitrogen --restore &
tint2 & #plank &
xscreensaver -no-splash &
root-tail -fn '-*-dejavu sans mono-*-r-*-*-20-*-*-*-*-*-*-*'  -g 500x460+0+0  /opt/ni_tools/lncd-linux/msg.txt  -outline -f
#xcompmgr &
xrdb ~/.Xdefaults # default term colors, alt key in xterm
openbox-session
