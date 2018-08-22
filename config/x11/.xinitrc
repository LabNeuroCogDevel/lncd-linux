#!/usr/bin/env sh
xrandr --output DVI-I-1 --left-of VGA-1
xbindkeys 
nitrogen --restore &
xcompmgr &
plank &
xscreensaver -no-splash &
openbox-session
