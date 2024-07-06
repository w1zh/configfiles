#!/bin/bash

# Get battery percentage
percentage=$(acpi | cut -d ',' -f 2 | cut -d ' ' -f 2 | tr -d '%')

# Determine ramp-capacity icon based on percentage
if [ "$percentage" -ge 90 ]; then
    icon=""
elif [ "$percentage" -ge 70 ]; then
    icon=""
elif [ "$percentage" -ge 40 ]; then
    icon=""
else
    icon=""
fi

echo "$icon $percentage%"

