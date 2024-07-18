#!/bin/sh
# toggle touchpad

if [ "$(xinput list-props bcm5974 | grep "Device Enabled" | awk '{print $4}')" == "1" ]; then
    xinput disable bcm5974
else
    xinput enable bcm5974
fi
