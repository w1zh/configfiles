#!/bin/bash

bluetooth_status=$(bluetoothctl show | grep "Powered: yes")

if [ -n "$bluetooth_status" ]; then
    if [ -n "$(bluetoothctl info | grep "Connected: yes")" ]; then
        echo "connected"
    else
        echo "on"
else
    echo "off"
fi

