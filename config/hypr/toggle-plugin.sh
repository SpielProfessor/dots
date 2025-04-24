#!/bin/bash

# Name of the plugin to toggle
PLUGIN_NAME=$1

# Get the full output of the hyprpm list command for the specified plugin
PLUGIN_STATUS=$(hyprpm list | grep -A 1 "$PLUGIN_NAME" | grep "enabled:" | awk '{print $3}')

# Check if the plugin's status was retrieved
if [ -z "$PLUGIN_STATUS" ]; then
    echo "Error: Plugin '$PLUGIN_NAME' not found or unable to get its status."
    exit 1
fi

# Debugging output
echo "Plugin '$PLUGIN_NAME' status: $PLUGIN_STATUS"

# Check if the plugin is enabled or disabled
if [[ "$PLUGIN_STATUS" == *"true"* ]]; then
    # If the plugin is enabled, disable it
    echo "Disabling $PLUGIN_NAME"
    hyprpm disable "$PLUGIN_NAME"
else
    # If the plugin is disabled, enable it
    echo "Enabling $PLUGIN_NAME"
    hyprpm enable "$PLUGIN_NAME"
fi

# Optionally, reload Hyprland to apply changes immediately
echo "Reloading Hyprland to apply changes..."
hyprctl reload

