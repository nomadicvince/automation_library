#!/bin/bash
# auto-mount.sh

echo "==== Auto-Mount External Drive ===="

DRIVE_LABEL="BACKUP_DRIVE"
MOUNT_POINT="/mnt/$DRIVE_LABEL"

UUID=$(blkid -L "$DRIVE_LABEL")
if [[ -z "$UUID" ]]; then
  echo "Drive with label '$DRIVE_LABEL' not found."
  exit 1
fi

sudo mkdir -p "$MOUNT_POINT"
sudo mount "$UUID" "$MOUNT_POINT"

echo "Drive mounted at $MOUNT_POINT"