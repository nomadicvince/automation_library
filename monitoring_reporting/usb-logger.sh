#!/bin/bash
# usb-logger.sh
# Displays the latest USB connect/disconnect events.

echo "==== USB Device Event Log ===="

# Check for journalctl
if ! command -v journalctl &> /dev/null; then
  echo "journalctl is not available."
  exit 1
fi

# Tail recent USB events
journalctl -k | grep -i usb | tail -n 20 || echo "No recent USB events found."