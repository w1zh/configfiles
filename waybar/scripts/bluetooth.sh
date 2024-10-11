#!/bin/bash

bluetooth_status=$(bluetoothctl show | grep "Powered: yes")

if [ -n "$bluetooth_status" ]; then
    echo "on"
else
    echo "off"
fi

