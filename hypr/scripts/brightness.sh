#!/bin/bash

# set brightness

MONITORS=(2 3 4)

# set brightness to all monitors
set_brightness() {
    local CURRENT_BRIGHTNESS=$(ddcutil getvcp ddcutil getvcp 10 | awk -F'= ' '/current value/ {print $2}' | awk -F', ' '{print $1}')
    CURRENT_BRIGHTNESS=$(($CURRENT_BRIGHTNESS))
    local VALUE=$1
    local NEW_BRIGHTNESS=$(( $CURRENT_BRIGHTNESS + ($VALUE) ))

    for monitor in ${MONITORS[@]}; do
        ddcutil setvcp --bus=$monitor 10 $NEW_BRIGHTNESS
    done
}

if [ $# -eq 0 ]; then
    echo "Usage: $0 <value>"
    exit 1
fi

set_brightness $1
