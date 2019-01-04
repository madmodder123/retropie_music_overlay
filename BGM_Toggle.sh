#!/usr/bin/env bash
# BGM_Toggle.sh
#############################################
# Lets the user enable/disable the background music
#############################################

if [ -f "/home/pi/DisableMusic" ]
then
	rm ~/DisableMusic
	(sudo python ~/BGM.py) &
else
    echo -n "Hello" > ~/DisableMusic
	sudo pkill -f BGM.py
	sudo pkill -f pngview
fi
