#!/bin/bash

# Define the wallpaper directory
WALLPAPER_DIR=~/Pictures/wallpapers/

# Check if the directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Wallpaper directory not found: $WALLPAPER_DIR"
    exit 1
fi

# Use find to get the list of files and pipe it to fzf.
# fzf will output the selected filename to stdout.
SELECTED_WALLPAPER=$(
    find -L "$WALLPAPER_DIR" -type f -print0 | fzf \
        --preview 'chafa -c 256 --size $(tput cols)x$(tput lines) {}' \
        --preview-window=right:70% \
        --layout=reverse \
        --bind "ctrl-p:toggle-preview" \
        --prompt="Select a wallpaper: " \
        --height=100% \
        --reverse \
        --exit-0 \
        --no-mouse \
        --header "Select a wallpaper with a live preview. Press 'Enter' to set it." \
        --color=dark \
        --ansi \
        --filepath-word \
        --with-nth=.. \
        --delimiter="\n" \
        --tiebreak=index \
        --read0
)

# Check if a wallpaper was selected (i.e., the user didn't press Esc or Ctrl+C)
if [ -n "$SELECTED_WALLPAPER" ]; then
    # Set the wallpaper using hyprctl hyprpaper
    hyprctl hyprpaper reload ,"$SELECTED_WALLPAPER"
fi
