#!/bin/bash
# lvm-tutorial.sh
# Advanced interactive LVM tutorial with demo (non-destructive)

clear
echo "==== Advanced LVM Tutorial ===="

echo "
LVM (Logical Volume Manager) abstracts physical storage into flexible, resizable volumes.

This tutorial will walk through:
- PV (Physical Volume)
- VG (Volume Group)
- LV (Logical Volume)
- Mounting, resizing, and snapshots

NOTE: This tutorial is READ-ONLY unless you confirm specific actions.
"

read -p "Continue? (y/n): " proceed
[[ "$proceed" != "y" ]] && exit 0

echo "
Step 1: Scan and List Block Devices
------------------------------------
Command: lsblk
Purpose: Shows disks and partitions.
"
read -p "Run this now? (y/n): " confirm && [[ "$confirm" == "y" ]] && lsblk

echo "
Step 2: View LVM Layers
------------------------
- sudo pvs
- sudo vgs
- sudo lvs
"
read -p "Run all LVM list commands now? (y/n): " confirm && [[ "$confirm" == "y" ]] && { sudo pvs; sudo vgs; sudo lvs; }

echo "
Step 3: Create LVM Stack (optional demo)
-----------------------------------------
This demo creates:
- loopback file as disk
- PV > VG > LV > mount

This is safe and non-destructive unless you choose 'y'.

Create demo LVM setup? (y/n): "
read demo
if [[ "$demo" == "y" ]]; then
  mkdir -p ~/lvm-demo
  fallocate -l 200M ~/lvm-demo/loopback.img
  sudo losetup -fP ~/lvm-demo/loopback.img
  LOOP=$(sudo losetup -a | grep loopback.img | cut -d: -f1)

  sudo pvcreate "$LOOP"
  sudo vgcreate demo-vg "$LOOP"
  sudo lvcreate -L 100M -n demo-lv demo-vg
  sudo mkfs.ext4 /dev/demo-vg/demo-lv
  sudo mount /dev/demo-vg/demo-lv /mnt

  echo "Demo volume mounted at /mnt"
fi

echo "
Step 4: Advanced Ops
---------------------
- Resize LV: sudo lvresize -L +50M /dev/demo-vg/demo-lv
- Snapshot: sudo lvcreate -s -n demo-snap -L 50M /dev/demo-vg/demo-lv
- Resize FS: sudo resize2fs /dev/demo-vg/demo-lv
- Remove: sudo umount /mnt && sudo lvremove -y demo-vg

This concludes the LVM tutorial.
"