#!/usr/bin/env bash
# BGM_Toggle.sh
#############################################
# Lets the user enable/disable the background music
#############################################

if [ -f ~/DisableMusic ]
then
	rm ~/DisableMusic
	python ~/BGM.py &
	#echo "Enabled"
else
    echo -n "Hello" > ~/DisableMusic
	sudo pkill -f BGM.py
	sudo pkill -f pngview
	#echo "Disabled"
fi
