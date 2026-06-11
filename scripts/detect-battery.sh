#!/bin/bash

for battery in /sys/class/power_supply/BAT*; do
    if [ -d "$battery" ]; then
        basename "$battery"
        exit 0
    fi
done

echo "No battery detected"
exit 1