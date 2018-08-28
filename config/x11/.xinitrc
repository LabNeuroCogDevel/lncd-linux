#!/usr/bin/env sh
#xcompmgr &
xrdb ~/.Xdefaults # default term colors, alt key in xterm
xrandr --output DVI-I-1 --left-of VGA-1
xbindkeys 
tint2 & #plank &
xscreensaver -no-splash &
conky &
#root-tail -fn '-*-dejavu sans mono-*-r-*-*-20-*-*-*-*-*-*-*'  -g 500x460+0+0  $HOME/src/lncd-linux/msg.txt  -outline -f
nitrogen --restore &
openbox-session
