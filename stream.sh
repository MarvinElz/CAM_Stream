#! /bin/bash
sudo modprobe bcm2835-v4l2
                                                                                                                                                                                                      
echo "Damit das Video in nahezu 'Echtzeit' läuft, muss dem Server eine höhere Bildrate vorgetäuscht werden."
echo "Dazu muss -fps 30 (raspivid) kleiner gewählt werden als -framerate 31 (ffmpeg)"
echo "Dabei kommt es ca. alls 30 Sekunden zu einem Buffering."
echo "Werden beide Bildraten gleich gewählt, tritt eine Latenz von ca. 5-6 Sekunden auf, aber dafür auch kein Buffering."

echo "Starte Video-Stream."
raspivid -o - -t 0 -vf -hf -fps 30 -w 1920 -h 1080 -b 6000000 -n | ffmpeg -re  -r 15 -ar 44100 -ac 2 -acodec pcm_s16le -f s16le  -ac 2 -i /dev/zero -f h264 -framerate 31  -i - -vcodec copy -acodec aac -ab 128k -strict experimental  -f flv rtmp://185.230.162.203/live/test

