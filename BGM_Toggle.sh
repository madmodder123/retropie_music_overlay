#!/usr/bin/env bash
# BGM_Toggle.sh
#############################################
# Lets the user enable/disable the background music
#############################################

if [ -f "/home/pi/DisableMusic" ]
then
	rm /home/pi/DisableMusic
	(sudo python /home/pi/BGM.py) &
else
    echo -n "Hello" > /home/pi/DisableMusic
	sudo pkill -f BGM.py
	sudo pkill -f pngview
fi
