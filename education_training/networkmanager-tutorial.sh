#!/bin/bash
# networkmanager-tutorial.sh
# Advanced NetworkManager CLI tutorial using nmcli

clear
echo "==== Advanced NetworkManager CLI Tutorial ===="

echo "
This tutorial covers:
- Devices and connection types
- Creating Wi-Fi and Ethernet profiles
- IP settings, DNS, and autoconnect
- Wi-Fi secrets management

WARNING: Do not run creation commands unless you know the interface names.
"

read -p "Continue? (y/n): " go
[[ "$go" != "y" ]] && exit 0

echo "
Step 1: View Devices & State
-----------------------------
nmcli device status
nmcli general status
"

read -p "Run device checks now? (y/n): " check
[[ "$check" == "y" ]] && nmcli device status && nmcli general status

echo "
Step 2: View Connection Profiles
---------------------------------
nmcli connection show
nmcli connection show <profile>
"

echo "
Step 3: Create Ethernet Profile (demo command)
-----------------------------------------------
nmcli con add type ethernet con-name demo-eth ifname eth0
"

echo "
Step 4: Add Static IP/DNS
---------------------------
nmcli con mod demo-eth ipv4.addresses 192.168.1.99/24
nmcli con mod demo-eth ipv4.gateway 192.168.1.1
nmcli con mod demo-eth ipv4.dns 8.8.8.8
nmcli con mod demo-eth ipv4.method manual

Enable Autoconnect:
nmcli con mod demo-eth connection.autoconnect yes
"

echo "
Step 5: Secure Wi-Fi Example (demo syntax)
-------------------------------------------
nmcli dev wifi list
nmcli dev wifi connect 'SSID' password 'your_password' --ask
"

echo "
Step 6: Restart Networking
---------------------------
sudo systemctl restart NetworkManager
nmcli networking off && sleep 2 && nmcli networking on
"

echo "Tutorial complete. Use 'nmcli help' for more examples."