#!/bin/bash
# firewall-viewer.sh

echo "==== Firewall Rules Viewer ===="

if systemctl is-active --quiet firewalld; then
  echo "Firewalld is active. Listing zones and rules..."
  sudo firewall-cmd --get-active-zones
  echo ""
  sudo firewall-cmd --list-all
elif command -v iptables &> /dev/null; then
  echo "Firewalld not active. Showing iptables rules..."
  sudo iptables -L -v -n
else
  echo "No firewall service detected."
fi