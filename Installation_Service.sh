#!/bin/bash
echo "Service kopieren."
sudo cp CAM_Stream.service /etc/systemd/system/CAM_Stream.service
sudo cp connect_to_network.service /etc/systemd/system/connect_to_network.service
echo "Rechte setzen."
sudo chown root:root /etc/systemd/system/CAM_Stream.service
sudo chown root:root /etc/systemd/system/connect_to_network.service
echo "Done."