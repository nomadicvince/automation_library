#!/bin/bash
# cron-visualizer.sh
# Displays crontab entries with labeled columns.

echo "==== Cron Job Visualizer ===="

# Get current user's crontab
CRONTAB=$(crontab -l 2>/dev/null)

if [[ -z "$CRONTAB" ]]; then
  echo "No crontab entries found."
  exit 0
fi

# Format and display
echo -e "Minute\tHour\tDay\tMonth\tWeekday\tCommand"
echo "$CRONTAB" | grep -v "^#" | while read -r line; do
  echo "$line" | awk '{printf "%s\t%s\t%s\t%s\t%s\t", $1,$2,$3,$4,$5; for(i=6;i<=NF;++i) printf "%s ", $i; print ""}'
done