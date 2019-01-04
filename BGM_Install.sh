#!/usr/bin/env bash
# BGM.sh
#############################################
# Install background music + overlay
#############################################

sudo apt-get install python-pygame imagemagick
cd ~
if [ -d "~/retropie_music_overlay" ]; #delete folder if it is there
then
	sudo rm -r ~/retropie_music_overlay
fi
git clone https://github.com/madmodder123/retropie_music_overlay.git
cd ~/retropie_music_overlay
sudo chmod +x pngview
sudo cp pngview /usr/local/bin/
sudo chmod +x BGM.py
sudo chown pi:pi BGM.py
sudo chmod 0777 BGM.py
if [ -f "~/BGM.py" ]; #Remove old version if it is there
then
	sudo rm -f ~/BGM.py
fi
sudo cp BGM.py ~/
mkdir ~/BGM/

sudo cp BGM.png ~/RetroPie/retropiemenu/icons/
sudo chmod +x BGM_Toggle.sh
sudo chown pi:pi BGM_Toggle.sh
sudo chmod 0777 BGM_Toggle.sh
if [ -f "~/RetroPie/retropiemenu/BGM_Toggle.sh" ]; #Remove old version if it is there
then
	sudo rm -f ~/RetroPie/retropiemenu/BGM_Toggle.sh
fi
sudo cp BGM_Toggle.sh ~/RetroPie/retropiemenu/

if [ ! -s ~/RetroPie/retropiemenu/gamelist.xml ] #Remove gamelist.xml if file size is 0
then
	sudo rm -f ~/RetroPie/retropiemenu/gamelist.xml
fi
if [ ! -f "~/RetroPie/retropiemenu/gamelist.xml" ]; #If file doesn't exist, copy gamelist.xml to folder
then
	sudo cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ~/RetroPie/retropiemenu/gamelist.xml
fi
CONTENT="<game>\n<path>~/RetroPie/retropiemenu/BGM_Toggle.sh</path>\n<name>Background Music</name>\n<desc>Toggles background music ON/OFF.</desc>\n<image>./icons/BGM.png</image>\n</game>"
C=$(echo $CONTENT | sed 's/\//\\\//g')
if grep -q BGM_Toggle.sh "~/RetroPie/retropiemenu/gamelist.xml"; #Check if menu entry is already there or not
then
  echo "gamelist.xml entry confirmed"
else
	sed "/<\/gameList>/ s/.*/${C}\n&/" ~/RetroPie/retropiemenu/gamelist.xml > ~/temp
	cat ~/temp > ~/RetroPie/retropiemenu/gamelist.xml
	rm -f ~/temp #yeah if you are reading this, you probably can see how ghetto that edit is^^ xD
fi
printf "\n\n\n"
echo "Place your music files in /home/pi/BGM/"
echo "Edit /home/pi/BGM.py for more options!"
echo "You will still have to set up the script to run automatically when the Pi boots!"
echo "Run \"sudo nano /etc/rc.local\" Near the bottom, on the line above \"exit 0\", put the following code

(sudo python ~/BGM.py) &

Press Control+X, Y, and Enter to save changes. Reboot and enjoy!

Example rc.local file: https://pastebin.com/67BnuB17"
