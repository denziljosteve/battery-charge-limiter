#!/bin/bash

BATTERY=$(bash /usr/local/bin/detect-battery.sh)

CAPACITY=$(cat /sys/class/power_supply/$BATTERY/capacity)

STATUS=$(cat /sys/class/power_supply/$BATTERY/status)

START=$(cat /sys/class/power_supply/$BATTERY/charge_control_start_threshold 2>/dev/null)

END=$(cat /sys/class/power_supply/$BATTERY/charge_control_end_threshold 2>/dev/null)

echo ""
echo "Battery: $BATTERY"
echo ""
echo "Current Charge: $CAPACITY%"
echo "Status: $STATUS"
echo ""
echo "Start Threshold: $START%"
echo "End Threshold: $END%"
echo ""

if [ -f "/sys/class/power_supply/$BATTERY/cycle_count" ]; then
    echo "Cycle Count: $(cat /sys/class/power_supply/$BATTERY/cycle_count)"
fi