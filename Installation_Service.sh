#!/bin/bash
echo "Service kopieren."
sudo cp CAM_Stream.service /etc/systemd/system/CAM_Stream.service
#sudo cp connect_to_network.service /etc/systemd/system/connect_to_network.service
echo "Rechte setzen."
sudo chown root:root /etc/systemd/system/CAM_Stream.service
#sudo chown root:root /etc/systemd/system/connect_to_network.service
echo "Done."
echo "connect_to_network.sh muss jetzt noch manuell in rc.local einfügen."
echo "/etc/rc.local"
echo "sudo bash /home/pi/CAM_Stream/connect_to_network.sh &"
