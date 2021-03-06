#!/bin/bash

pkill pulse | echo "pulse was not running"
if [ $SUDO_USER ]; then user=$SUDO_USER; else user=`whoami`; fi
export XAUTHORITY=/home/$user/.Xauthority
export DISPLAY=':0'
shairport-sync -o alsa -c pulse -c /etc/shairport-sync.conf&
pulseaudio -nF /etc/pulse/default.pa&
## Uncomment to have pulseaudio-dlna start correctly
pulseaudio-dlna&
nodejs ~/projects/node/server.js&
