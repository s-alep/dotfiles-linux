#!/bin/bash

monitor_count=$(hyprctl monitors | rg Monitor | wc -l)

if [[ "$monitor_count" -gt 1 ]]; then
    hyprctl keyword monitor "eDP-1, disable"
elif [[ "$monitor_count" -eq 1 ]]; then
    hyprlock && systemctl suspend
fi

