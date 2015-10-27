#!/bin/sh

# X settings
xset s 600 600 # Sets screen blank time to 10 minutes
xset +fp /usr/share/fonts/local
xset fp rehash
setxkbmap -option ctrl:nocaps # makes caps lock ctrl
xset r rate 220 25 # kb rate
xset m 1 4 

# Disable touchpad
synclient TouchpadOff=1

# Start software
xflux -z 90605 -k 4600 # turns on f.lux for screen coloring
/opt/urserver/urserver --daemon&
/usr/bin/start-pulseaudio-x11
albert&
compton -cG&
urxvtd&
exec i3
