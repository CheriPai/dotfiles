#!/bin/sh

# X settings
setterm -blank 0 -powerdown 0
xset +fp /usr/share/fonts/local
xset fp rehash
setxkbmap -option ctrl:nocaps # makes caps lock ctrl
xset r rate 220 25 # kb rate
xset m 1 4 
xset s off -dpms

# Disable touchpad
synclient TouchpadOff=1

xrdb ~/.Xresources

# Start software
/opt/urserver/urserver --daemon&
/usr/bin/start-pulseaudio-x11
compton -cfG&
urxvtd&
exec i3
