#!/bin/bash
# open-ports.sh
# Lists open TCP and UDP ports and the processes listening on them.

echo "==== Open Ports Monitor ===="

# Check if ss is available
if ! command -v ss &> /dev/null; then
  echo "ss command not found. Please install iproute package."
  exit 1
fi

# Show listening ports with process info
ss -tuln -p | grep LISTEN || echo "No listening ports found."