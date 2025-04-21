#!/bin/bash
# backup-to-drive.sh

echo "==== Scheduled Backup to External Drive ===="

SRC_DIR="$HOME/Documents"
DEST_MOUNT="/run/media/$USER/BACKUP_DRIVE"
DEST_DIR="$DEST_MOUNT/backup_$(date +%F_%T)"

if [[ ! -d "$DEST_MOUNT" ]]; then
  echo "Error: External drive not mounted at $DEST_MOUNT"
  exit 1
fi

mkdir -p "$DEST_DIR"
rsync -av --delete "$SRC_DIR/" "$DEST_DIR/"

echo "Backup completed to: $DEST_DIR"

_______________________________________

Add to crontab -e to schedule

0 2 * * * /home/youruser/scripts/backup-to-drive.sh >> /var/log/backup.log 2>&1