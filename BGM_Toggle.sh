#!/usr/bin/env bash
# BGM_Toggle.sh
#############################################
# Lets the user enable/disable the background music
#############################################

if [ -f ~/DisableMusic ]
then
	# Enabled
	sudo rm ~/DisableMusic
	python ~/BGM.py &
	echo -e "\n\n\n                               Background Music Enabled!\n\n\n"
    sleep 3
else
    #Disabled
	touch ~/DisableMusic
	sudo pkill -f BGM.py
	sudo pkill -f pngview
	echo -e "\n\n\n                               Background Music Disabled!\n\n\n"
    sleep 3
fi
