#! /bin/bash

sleep 20
echo "sakis3gz das erste Mal gestartet."
sudo /home/pi/sakis3g/build/sakis3gz OTHER="USBMODEM" USBMODEM="12d1:1506" USBINTERFACE="1" APN="internet" APN_USER="u" APN_PASS="p" connect &
echo "Schlafe für 40 Sekunden."
sleep 40
echo "Abbrechen von sakis3gz."
sudo pkill sakis3gz
echo "Erneutes Starten von sakis3gz."
sudo /home/pi/sakis3g/build/sakis3gz OTHER="USBMODEM" USBMODEM="12d1:1506" USBINTERFACE="1" APN="internet" APN_USER="u" APN_PASS="p" connect &
echo "Schlafe für 5 Sekunden."
sleep 5

#echo "Abbrechen von sakis3gz."
#sudo pkill sakis3gz

echo "Default Route hinzufügen."
sudo route add default dev ppp0