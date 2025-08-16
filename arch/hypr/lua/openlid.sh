#!/bin/bash

monitor_count=$(hyprctl monitors all | rg Monitor | wc -l)
monitor_on=$(hyprctl monitors | rg Monitor | wc -l)

if [[ "$monitor_count" -gt 1 ]]; then
    hyprctl keyword monitor "eDP-1, enable"
    hyprctl keyword monitor "eDP-1, 1680x1050"
fi

if [[ "$monitor_on" -eq 0 ]]; then
    hyprctl keyword monitor "eDP-1, enable"
    hyprctl keyword monitor "eDP-1, 1680x1050"
fi
