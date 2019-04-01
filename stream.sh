#! /bin/bash
#avconv -i /dev/video0 -deinterlace -vcodec h264_omx -pix_fmt yuv420p -preset medium -r 30 -b:v 5000k -acodec libmp3lame -ar 44100 -threads 4 -qscale 3 -b:a 44100 -bufsize 512k -f flv rtmp://a.rtmp.youtube.com/live2/tyg5-k92t-hj34-062d
# ffmpeg -i /dev/video0 -deinterlace -vcodec libx264 -pix_fmt yuv420p -preset medium -r 30 -g 60 -b:v 1000k -acodec libmp3lame -ar 44100 -threads 4 -qscale 3 -b:a 44100 -bufsize 512k -f flv rtmp://a.rtmp.youtube.com/live2/tyg5-k92t-hj34-062d
#sudo modprobe bcm2835-v4l2


#raspivid -o - -t 0 -vf -hf -fps 60 -b 6000000 -w 1000 -h 720 | ffmpeg -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f h264 -i - -vcodec copy -acodec aac -ab 128k -g 30 -strict experimental -f flv rtmp://a.rtmp.youtube.com/live2/tyg5-k92t-hj34-062d

# Server-IP: 192.168.20.108


# HD-Ready#                                                                                                                                                                                                      V -b 5000k             
raspivid -o - -t 0 -vf -hf -fps 30 -w 1920 -h 1080 -b 7000000 -n | ffmpeg -re  -r 15 -ar 44100 -ac 2 -acodec pcm_s16le -f s16le  -ac 2 -i /dev/zero -f h264 -framerate 30  -i - -vcodec copy -acodec aac -ab 128k -strict experimental  -f flv rtmp://192.168.20.107/live/test

# Full-HD
# raspivid -o - -t 0 -vf -hf -fps 30 -w 1920 -h 1080 | ffmpeg -re  -r 15 -ar 44100 -ac 2 -acodec pcm_s16le -f s16le  -ac 2 -i /dev/zero -f h264 -framerate 30  -i - -vcodec copy -acodec aac -ab 128k -b 5000k -strict experimental  -f flv rtmp://192.168.178.26/live/test
## -vf -g 30 -rtbufsize 1500M  -b:v 5M -maxrate 5M -bufsize 3M


