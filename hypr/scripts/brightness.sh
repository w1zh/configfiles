#!/bin/bash

# Set brightness on all monitors

# List of monitor IDs (bus numbers) for ddcutil
MONITORS=(3 4)

# Function to set brightness
set_brightness() {
    # Get the current brightness of the first monitor as a baseline
    local CURRENT_BRIGHTNESS=$(ddcutil getvcp --bus=${MONITORS[0]} 10 | awk -F'= ' '/current value/ {print $2}' | awk -F', ' '{print $1}')
    CURRENT_BRIGHTNESS=$((CURRENT_BRIGHTNESS))  # Convert to integer

    # Calculate the new brightness value
    local VALUE=$1
    local NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS + VALUE))

    # Ensure brightness stays within 0-100 range
    if [ $NEW_BRIGHTNESS -lt 0 ]; then
        NEW_BRIGHTNESS=0
    elif [ $NEW_BRIGHTNESS -gt 100 ]; then
        NEW_BRIGHTNESS=100
    fi

    # Apply the new brightness to each monitor
    for monitor in "${MONITORS[@]}"; do
        ddcutil setvcp --bus=$monitor 10 $NEW_BRIGHTNESS
    done
}

# Check if the script was run with an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <value>"
    exit 1
fi

# Call the function with the provided argument
set_brightness $1

