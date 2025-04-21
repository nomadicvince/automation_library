#!/bin/bash
# snapshot.sh

echo "==== Filesystem Snapshot Script ===="

if mount | grep -q "btrfs"; then
  echo "Btrfs detected. Creating snapshot..."
  SNAPSHOT_DIR="/.snapshots/snapshot-$(date +%F-%T)"
  sudo btrfs subvolume snapshot / "$SNAPSHOT_DIR"
  echo "Btrfs snapshot created at $SNAPSHOT_DIR"
elif mount | grep -q "mapper"; then
  echo "LVM detected. Creating snapshot..."
  LV=$(sudo lvs --noheadings -o lv_name | awk '{print $1}' | head -n 1)
  VG=$(sudo vgs --noheadings -o vg_name | awk '{print $1}' | head -n 1)
  sudo lvcreate --size 2G --snapshot --name snap_${LV}_$(date +%F-%H%M) /dev/$VG/$LV
  echo "LVM snapshot created for /dev/$VG/$LV"
else
  echo "Neither Btrfs nor LVM detected."
  exit 1
fi