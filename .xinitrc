#!/bin/sh

# X settings
xset s off # disable screen saver blanking
xset +fp /usr/share/fonts/local
xset fp rehash
setxkbmap -option ctrl:nocaps # makes caps lock ctrl
xset r rate 220 25 # kb rate
xset m 1 4 

# Disable touchpad
synclient TouchpadOff=1

# Start software
xflux -z 90605 -k 3800 # turns on f.lux for screen coloring
/opt/urserver/urserver --daemon&
/usr/bin/start-pulseaudio-x11
compton -cfG&
urxvtd&
exec i3
