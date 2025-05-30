#!/usr/bin/env bash

# Gracefully close all apps
hyprctl --batch "$(hyprctl -j clients | jq -j '.[] | "dispatch closewindow address:\(.address); "')"

# Clear clipboard history (for security)
cliphist wipe

sleep 1

# Exit Hyprland
hyprctl dispatch exit

sleep 1

# Kill it as well just in case (sometimes it doesn't exit?)
pkill -9 Hyprland