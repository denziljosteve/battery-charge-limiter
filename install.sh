#!/bin/bash

set -e

echo "Installing Battery Charge Limiter..."

BATTERY=$(./scripts/detect-battery.sh)

echo "Detected battery: $BATTERY"

if [ ! -f "/sys/class/power_supply/$BATTERY/charge_control_start_threshold" ]; then
    echo ""
    echo "Battery threshold controls not supported."
    exit 1
fi

sudo cp scripts/detect-battery.sh /usr/local/bin/detect-battery.sh
sudo cp scripts/set-threshold.sh /usr/local/bin/set-threshold.sh
sudo cp scripts/battery-limit.sh /usr/local/bin/battery-limit.sh
sudo cp scripts/status.sh /usr/local/bin/battery-status

sudo chmod +x /usr/local/bin/*battery*
sudo chmod +x /usr/local/bin/detect-battery.sh
sudo chmod +x /usr/local/bin/set-threshold.sh

sudo cp config/battery-limit.conf /etc/battery-limit.conf

sudo cp systemd/battery-limit.service \
/etc/systemd/system/battery-limit.service

sudo systemctl daemon-reload

sudo systemctl enable battery-limit.service

sudo systemctl start battery-limit.service

echo ""
echo "Installation complete."
echo ""
echo "Run:"
echo "battery-status"