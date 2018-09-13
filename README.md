This has all the files needed to install the background music script with added overlays!
Just make the bash script executable with "sudo chmod +x BGM_Install.sh" and run it and it will do the following:

Download/install python-pygame and imagemagick.

Move pngview to the correct directory.

Create the /home/pi/BGM folder for music.

Pictures here: https://imgur.com/a/J9iek

<br><br>
Edit these to adjust the script to your needs:
<br>
###CONFIG SECTION###

startdelay = 0 # Value (in seconds) to delay audio start.  If you have a splash screen with audio and the script is playing music over the top of it, increase this value to delay the script from starting.

musicdir = '/home/pi/BGM'

maxvolume = 0.75

volumefadespeed = 0.02

restart = True # If true, this will cause the script to fade the music out and -stop- the song rather than pause it.

startsong = "" # if this is not blank, this is the EXACT, CaSeSeNsAtIvE filename of the song you always want to play first on boot.

<br>
###Overlay Config###

overlay_enable = True

overlay_pngview_location = '/usr/local/bin/pngview'

overlay_background_color = 'black'

overlay_text_color = 'white'

overlay_text_font = 'FreeSans'

overlay_tmp_file = '/dev/shm/song_title.png'

<br><br>


Props to Livewire for the original script: https://retropie.org.uk/forum/topic/347/background-music-continued-from-help-support

Special thanks to AndrewFromMelbourne for pngview: https://github.com/AndrewFromMelbourne/raspidmx

RetroPie forum thread: https://retropie.org.uk/forum/topic/16458/modified-background-music-script-with-added-overlays
