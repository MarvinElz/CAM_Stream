#!bin/bash

# https://obsproject.com/forum/resources/how-to-set-up-your-own-private-rtmp-server-using-nginx.50/

mkdir nginx_install
cd nginx_install

sudo apt-get update
sudo apt-get install build-essential libpcre3 libpcre3-dev libssl-dev zip unzip

wget http://nginx.org/download/nginx-1.15.9.tar.gz
wget https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/dev.zip

tar -zxvf nginx-1.15.9.tar.gz

unzip dev.zip

cd nginx-1.15.9

./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-dev
make 
sudo make install 

echo "Erstelle Sicherheitskopie: /usr/local/nginx/conf/nginx_save.conf"
# sudo /usr/local/nginx/sbin/nginx 
sudo cp /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx_save.conf

echo "Schreibe Konfig-Datei"
sudo rm /usr/local/nginx/conf/nginx.conf
sudo echo "
#user  nobody;
worker_processes  1;

events {
    worker_connections  1024;
}

rtmp {
      server {
            listen 1935;
            chunk_size 4096;
            allow publish 192.168.20.51;
            deny publish all;

            allow play all;

            application live {
                  live on;
                  record off;
            }
      }
}" >> /usr/local/nginx/conf/nginx.conf

echo "Neustart von NGINX"
sudo /usr/local/nginx/sbin/nginx -s stop
sudo /usr/local/nginx/sbin/nginx