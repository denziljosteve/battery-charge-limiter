#!/bin/bash

CONFIG="/etc/battery-limit.conf"

if [ ! -f "$CONFIG" ]; then
    echo "Configuration file missing"
    exit 1
fi

source "$CONFIG"

BATTERY=$(bash /usr/local/bin/detect-battery.sh)

START_FILE="/sys/class/power_supply/$BATTERY/charge_control_start_threshold"
END_FILE="/sys/class/power_supply/$BATTERY/charge_control_end_threshold"

if [ ! -f "$START_FILE" ] || [ ! -f "$END_FILE" ]; then
    echo "Battery threshold control not supported"
    exit 1
fi

echo "$START_THRESHOLD" > "$START_FILE"
echo "$END_THRESHOLD" > "$END_FILE"

echo "Applied thresholds:"
echo "Start: $START_THRESHOLD%"
echo "End: $END_THRESHOLD%"