#!/bin/bash

echo "==== Disk Cleanup Script ===="

# Ensure script is run as root
if [[ "$EUID" -ne 0 ]]; then
  echo "Please run this script with sudo."
  exit 1
fi

echo "[1/5] Cleaning DNF cache..."
dnf clean all

echo "[2/5] Removing journal logs older than 7 days..."
journalctl --vacuum-time=7d

echo "[3/5] Deleting user thumbnail cache..."
rm -rf /home/*/.cache/thumbnails/*

echo "[4/5] Removing orphaned packages..."
dnf autoremove -y

echo "[5/5] Uninstalling unused Flatpak packages..."
flatpak uninstall --unused -y

echo "Disk cleanup complete."