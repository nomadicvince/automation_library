#!/bin/bash
# log-analyzer.sh
# Scans a system log file for keywords like error, fail, critical, and panic.

LOG_FILE="/var/log/messages"
KEYWORDS=("error" "fail" "critical" "panic")

echo "==== System Log Analyzer ===="

# Check if log file exists
if [[ ! -f "$LOG_FILE" ]]; then
  echo "Log file not found: $LOG_FILE"
  exit 1
fi

# Search for each keyword and show last 5 entries
for word in "${KEYWORDS[@]}"; do
  echo -e "\n[+] Matches for '$word':"
  grep -i "$word" "$LOG_FILE" | tail -n 5 || echo "No matches found."
done