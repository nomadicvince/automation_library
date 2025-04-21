#!/bin/bash
# wifi-logger.sh

echo "==== WiFi Signal Logger ===="

LOG_FILE="$HOME/wifi_signal.log"

SSID=$(nmcli -t -f active,ssid dev wifi | grep "^yes" | cut -d: -f2)
SIGNAL=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep "*" | cut -d: -f2)

echo "$(date): SSID=$SSID Signal=$SIGNAL%" >> "$LOG_FILE"
echo "Logged: SSID=$SSID, Signal=$SIGNAL%"