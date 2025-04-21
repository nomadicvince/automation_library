#!/bin/bash
# weekly-journal.sh
# Prompts for a journal entry and saves it with a timestamp.

JOURNAL_DIR="$HOME/journal"
FILE="$JOURNAL_DIR/$(date +%F).txt"

echo "==== Weekly Journal Logger ===="

# Create journal directory if it doesn't exist
mkdir -p "$JOURNAL_DIR"

# Prompt user for input
read -p "Write your journal entry: " entry

# Append with timestamp
echo "$(date '+%Y-%m-%d %H:%M:%S') — $entry" >> "$FILE"

echo "Entry saved to: $FILE"