#!/usr/bin/env bash
# BGM.sh
#############################################
# Install background music + overlay
#############################################


sudo apt-get install python-pygame imagemagick
cd /home/pi
git clone https://github.com/madmodder123/retropie_music_overlay.git
cd /home/pi/retropie_music_overlay
sudo chmod +x pngview
sudo cp pngview /usr/local/bin/
sudo chmod +x BGM.py
sudo cp BGM.py /home/pi/
mkdir /home/pi/BGM/

sudo cp BGM.png /home/pi/RetroPie/retropiemenu/icons/
sudo chmod +x BGM_Toggle.sh
sudo cp BGM_Toggle.sh /home/pi/RetroPie/retropiemenu/
CONTENT="<game>\n<path>/home/pi/RetroPie/retropiemenu/BGM_Toggle.sh</path>\n<name>Background Music</name>\n<desc>Toggles background music ON/OFF.</desc>\n<image>./icons/BGM.png</image>\n</game>"
C=$(echo $CONTENT | sed 's/\//\\\//g')
sed "/<\/gameList>/ s/.*/${C}\n&/" /home/pi/RetroPie/retropiemenu/gamelist.xml > /home/pi/temp
cat /home/pi/temp > /home/pi/RetroPie/retropiemenu/gamelist.xml
rm -f /home/pi/temp #yeah if you are reading this, you probably can see how ghetto that edit is^^ xD

echo "Place your music files in /home/pi/BGM/"
echo "Edit /home/pi/BGM.py for more options!"
echo "You will still have to set up the script to run automatically when the Pi boots!"
echo "You can find out how to do this from the README.md file in the \"retropie_music_overlay\" folder or on the GitHub page."