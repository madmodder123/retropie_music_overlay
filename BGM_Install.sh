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

echo "Place your music files in /home/pi/BGM/ and then set /home/pi/BGM.py to run on boot!"
echo "Edit /home/pi/BGM.py for more options!"