#!/bin/bash

echo "Removing Battery Charge Limiter..."

sudo systemctl stop battery-limit.service

sudo systemctl disable battery-limit.service

sudo rm -f /etc/systemd/system/battery-limit.service

sudo rm -f /usr/local/bin/detect-battery.sh
sudo rm -f /usr/local/bin/set-threshold.sh
sudo rm -f /usr/local/bin/battery-limit.sh
sudo rm -f /usr/local/bin/battery-status

sudo rm -f /etc/battery-limit.conf

sudo systemctl daemon-reload

echo "Removed successfully."