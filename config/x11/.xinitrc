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

# middle button + trackpoint is scroll
xinput set-int-prop 10 "Evdev Wheel Emulation" 8 1
xinput set-int-prop 10 "Evdev Wheel Emulation Button" 8 2

openbox-session
