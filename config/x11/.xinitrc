#!/usr/bin/env sh
xcompmgr &
xrdb ~/.Xdefaults # default term colors, alt key in xterm
xbindkeys 
lxpanel & #tint2 & #plank &
#xscreensaver -no-splash &
(sleep 10;  conky) &
#root-tail -fn '-*-dejavu sans mono-*-r-*-*-20-*-*-*-*-*-*-*'  -g 500x460+0+0  $HOME/src/lncd-linux/msg.txt  -outline -f
nitrogen --restore &
nm-applet &
openbox-session
