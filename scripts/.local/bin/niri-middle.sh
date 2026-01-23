#!/bin/bash

# Get the focused window and its workspace
FOCUSED_OUTPUT=$(niri msg -j focused-window)
if [ $? -ne 0 ]; then
    echo "Error getting focused window"
    exit 1
fi

# Extract workspace from focused window output
FOCUSED_WORKSPACE=$(echo "$FOCUSED_OUTPUT" | jq -r '.workspace_id')
if [ "$FOCUSED_WORKSPACE" = "null" ] || [ -z "$FOCUSED_WORKSPACE" ]; then
    echo "Error extracting workspace from focused window"
    exit 1
fi

echo "Focused window is in workspace: $FOCUSED_WORKSPACE"

# Get all windows
WINDOWS_OUTPUT=$(niri msg -j windows)
if [ $? -ne 0 ]; then
    echo "Error getting windows list"
    exit 1
fi

# Process each window that is in the same workspace as the focused window
echo "$WINDOWS_OUTPUT" | jq -c --arg workspace "$FOCUSED_WORKSPACE" '
    .[] | select(.workspace_id == ($workspace | tonumber) and .id != null) 
    | {id: .id}
' | while read -r window; do
    WINDOW_ID=$(echo "$window" | jq -r '.id')
    if [ "$WINDOW_ID" != "null" ] && [ -n "$WINDOW_ID" ]; then
        echo "Processing window ID: $WINDOW_ID"
        
        # Focus the window
        niri msg action focus-window --id "$WINDOW_ID"
        if [ $? -eq 0 ]; then
            echo "Focused window $WINDOW_ID"
            
            # Resize the column to 50%
            niri msg action set-column-width 50%
            if [ $? -eq 0 ]; then
                echo "Resized column to 50% for window $WINDOW_ID"
            else
                echo "Error resizing column for window $WINDOW_ID"
            fi
        else
            echo "Error focusing window $WINDOW_ID"
        fi
        
        echo "---"
    fi
done

echo "Script completed"