#!/bin/bash

# Get current brightness percentage using brightnessctl
CURRENT_BRIGHTNESS=$(brightnessctl -m | grep -oP '\d+(?=%)' | head -n1)

# Print the brightness value
echo "$CURRENT_BRIGHTNESS%"

