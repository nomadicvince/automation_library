#!/bin/bash
# screenshot-organizer.sh
# Moves all screenshots to a dated archive folder.

SRC_DIR="$HOME/Pictures/Screenshots"
DEST_DIR="$SRC_DIR/Archive/$(date +%Y-%m-%d)"

echo "==== Screenshot Organizer ===="

# Make sure source directory exists
if [[ ! -d "$SRC_DIR" ]]; then
  echo "Source directory not found: $SRC_DIR"
  exit 1
fi

mkdir -p "$DEST_DIR"

# Move files
FILE_COUNT=$(find "$SRC_DIR" -maxdepth 1 -type f -name '*.png' | wc -l)

if [[ "$FILE_COUNT" -eq 0 ]]; then
  echo "No screenshots to move."
else
  find "$SRC_DIR" -maxdepth 1 -type f -name '*.png' -exec mv {} "$DEST_DIR" \;
  echo "Moved $FILE_COUNT screenshot(s) to $DEST_DIR"
fi